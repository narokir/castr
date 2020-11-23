import { Controller } from 'stimulus';
import { DirectUpload } from '@rails/activestorage';
import 'cropperjs/dist/cropper.css';
import Cropper from 'cropperjs';

export default class extends Controller {
  static targets = ['source'];

  cropAvatar() {
    let form = document.querySelector('#avatar-form');
    let $modal = $('#crop-modal');
    const input = this.sourceTarget;
    const file = input.files[0];
    let cropper;

    // cache the image file name
    var cachedFilename = file.name;
    let img = document.createElement('img');

    // read the input file in open modal
    const reader = new FileReader();
    reader.onloadend = (e) => {
      if (e.target.result) {
        img.id = 'avatar';
        img.class = 'img-fluid';
        img.src = e.target.result;
        $modal.find('.image-container').html(img);
        $modal.modal('show');
      }
    };
    reader.readAsDataURL(file);

    // When modal opens init Cropper
    $modal.on('shown.bs.modal', function () {
      cropper = new Cropper(img, {
        aspectRatio: 1,
        //viewMode: 3,
      });
    });

    class MyUploader {
      constructor(file, url) {
        this.upload = new DirectUpload(this.file, this.url, this);
      }

      directUploadWillStoreFileWithXHR(request) {
        request.upload.addEventListener('progress', (event) =>
          this.directUploadDidProgress(event)
        );
        request.addEventListener('load', (event) => this.requestDidLoad(event));
      }

      directUploadDidProgress(event) {
        const progress = (event.loaded / event.total) * 100;
        console.log(progress);
      }
      requestDidLoad(event) {
        // submit the avatar form when direct upload ends
        document.querySelector('#avatar-form').submit();
      }
    }

    // listen for crop btn click
    document.querySelector('.crop-btn').addEventListener('click', () => {
      let canvas;

      // get the cropped thing. its a canvas
      if (cropper) {
        canvas = cropper.getCroppedCanvas({
          width: 160,
          height: 160,
        });
      }

      // convert canvas to blob and init DirectUpload
      canvas.toBlob((blob) => {
        blob.name = cachedFilename;
        const url = input.dataset.directUploadUrl;
        const my_uploader = new MyUploader(blob, url);
        const upload = new DirectUpload(blob, url, my_uploader);

        upload.create((error, blob) => {
          if (error) {
            console.log('direct-upload:error');
            return;
          } else {
            const hiddenField = document.createElement('input');
            hiddenField.setAttribute('type', 'hidden');
            hiddenField.setAttribute('value', blob.signed_id);
            hiddenField.name = input.name;
            document.querySelector('form').appendChild(hiddenField);
          }
        });
      });

      // close modal and kill Cropper
      $modal.modal('hide');
      $modal.on('hidden.bs.modal', function () {
        cropper.destroy();
        cropper = null;
      });
    });
  }
}

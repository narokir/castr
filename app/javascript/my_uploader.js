import { DirectUpload } from '@rails/activestorage';
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
    document.querySelector('#avatar-form').submit();
  }
}
export { MyUploader };

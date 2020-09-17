// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require('@rails/ujs').start();
require('turbolinks').start();
require('@rails/activestorage').start();
require('channels');
require('trix');
require('@rails/actiontext');

//Bootstrap
import 'bootstrap';
import '../stylesheets/application';

$(function () {
  $('[data-toggle="tooltip"]').tooltip();
});

import 'controllers';
import 'toaster/bootstrap_toast';

// dark mode
import 'dark-mode-switch/dark-mode-switch';
//require('dark-mode-switch/dark-mode.css');

// flatpicker(Date Picker)
import flatpickr from 'flatpickr';
require('flatpickr/dist/flatpickr.css');

document.addEventListener('turbolinks:load', () => {
  flatpickr("[data-behavior='flatpickr']", {
    altInput: true,
    altFormat: 'F j, Y',
    //dateFormat: 'm-d-Y',
  });
});

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

var jQuery = require('jquery');

// include jQuery in global and window scope (so you can access it globally)
// in your web browser, when you type $('.div'), it is actually refering to global.$('.div')
global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;

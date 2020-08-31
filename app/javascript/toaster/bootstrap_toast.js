// init bootstrap toast
document.addEventListener('turbolinks:load', () => {
  $('.toast').toast({
    autohide: true,
    delay: 7000,
  });
  $('.toast').toast('show');
});

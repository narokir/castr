document.addEventListener('turbolinks:load', () => {
  (function () {
    var darkSwitch = document.getElementById('darkSwitch');
    var navBg = document.getElementById('main-nav');
    if (darkSwitch) {
      initTheme();
      darkSwitch.addEventListener('change', function (event) {
        resetTheme();
      });
      function initTheme() {
        var darkThemeSelected =
          localStorage.getItem('darkSwitch') !== null &&
          localStorage.getItem('darkSwitch') === 'dark';
        darkSwitch.checked = darkThemeSelected;
        darkThemeSelected
          ? document.body.setAttribute('data-theme', 'dark')
          : document.body.removeAttribute('data-theme');
        navBg.classList.add('navbar-light', 'bg-light');
      }
      function resetTheme() {
        if (darkSwitch.checked) {
          document.body.setAttribute('data-theme', 'dark');
          localStorage.setItem('darkSwitch', 'dark');
        } else {
          document.body.removeAttribute('data-theme');
          localStorage.removeItem('darkSwitch');
          //navBg.classList.remove("navbar-dark","bg-dark");
          //navBg.classList.add("navbar-light","bg-light");
        }
      }
    }
  })();
});

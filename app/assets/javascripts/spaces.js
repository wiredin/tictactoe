$(document).on("ajax:complete", function(event) {
  Turbolinks.clearCache()
  Turbolinks.visit('/');
});

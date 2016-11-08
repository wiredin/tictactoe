$(document).on("click", "[data-behavior~=toggle_form_on_click]", function(event) {
  event.preventDefault();
  $(this).parent().find('.edit_space').submit();
});
$(document).on("ajax:complete", function(event) {
  Turbolinks.clearCache()
  Turbolinks.visit('/');
});

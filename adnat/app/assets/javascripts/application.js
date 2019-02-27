//= require jquery3
//= require jquery_ujs
//= require_tree .
//= require popper
//= require bootstrap-sprockets

//Alert/Notice FadeOuts
$(document).ready(function() {
  $("#notification-wrapper").click(function() {
    $(this.remove());
  });

  setTimeout(function() {
    $("#notification-wrapper").fadeOut("slow", function() {
      //After fade do:
      $(this).remove();
    });
  }, 2500);
});

$(document).ready(function () {
  //show modal
  $('#help').click(
    function() { $('#help_modal').fadeIn(600); }
  );
  //hide modal
  $('.close').click(
    function() { $('#help_modal').fadeOut('slow'); }
  );
});
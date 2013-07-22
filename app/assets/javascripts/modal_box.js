$(document).ready(function () {
  //show modal
  $('#help').click(
    function() { $('#help_modal').show('fast'); }
  );
  $('.close').click(
    function() { $('#help_modal').hide('slow'); }
  );
});
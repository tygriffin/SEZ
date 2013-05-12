$(document).ready(function() {
  // Set up bubble CSS when page is loaded so bubble info is hidden unless user acts.
  // If JavaScript is turned off bubble info displays normally.
  //
  //

  $('.bubble_wrapper').css('position', 'relative');
  $('.bubble_info').css({
    position: 'absolute',
    margin: '0 0 0 80px'
  });
  $('.bubble_info').hide();
  $('.bubble_close').css('display', 'block');
  jQuery.easing.def = "easeInOutBack";
});

$(function() {
  var counter = 1;
  $('.bubble_wrapper').each(function() {
    var trigger = $('#bubble_trigger'+counter, this);
    var popup = $('#bubble_info'+counter, this);

    $([trigger.get(0), popup.get(0)]).click(function() {
      $('.bubble_info').hide();
      popup.show('fast');
    });

    $('.bubble_close').click(function(e) {
      e.stopPropagation();
      popup.hide('fast');
    });

    counter += 1;
  });
});


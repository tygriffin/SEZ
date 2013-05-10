$(document).ready(function() {
  // Set up bubble CSS when page is loaded so bubble info is hidden unless user acts.
  // If JavaScript is turned off bubble info displays normally.
  $('.bubble_wrapper').each(function() {
    $(this).css('position', 'relative');
  });
  $('.bubble_info').each(function() {
    $(this).css({
      position: 'absolute',
      display: 'none'
    });
  });
});

$(function() {
  $('.bubble_wrapper').each(function() {
    var counter = 1;
    var trigger = $('#bubble_trigger'+counter, this);
    var popup = $('#bubble_info'+counter, this);

    $([trigger.get(0), popup.get(0)]).click(function() {
      popup.css({
        display: 'block'
      })
    });
    counter += 1;
  });
});
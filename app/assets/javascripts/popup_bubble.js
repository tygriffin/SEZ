$(document).ready(function() {
  // Set up bubble CSS when page is loaded so bubble info is hidden unless user acts.
  // If JavaScript is turned off bubble info displays normally.
  //
  //

  $('.bubble_wrapper').css('position', 'relative');
  $('.bubble_info').css({
    backgroundColor: '#a9caa68',
    opacity:'90%',
    position: 'absolute',
    zIndex: '100'
  });
  $('.bubble_info p, .bubble_info h1').css({
    width: '300px'
  });
  $('.bubble_info').hide();
  $('.bubble_close').css('display', 'block');
  $('.vocab_bubble_wrapper').css('position', 'relative');

  jQuery.easing.def = "easeInOutBack";
});

$(function() {
  $('.bubble_wrapper').each(function() {
    $('.bubble_trigger').click(function() {
      $('.bubble_info').hide();
      $(this).next().stop().show('fast');
    });

    $('.bubble_close').click(function(e) {
      e.stopPropagation();
      $('.bubble_info').hide('fast');
    });
  });
});

$(function() {
  $('.vocab_bubble_trigger').mouseenter(function() {
    for (i=0; i<gon.vocab.length; i++) {
      entry = gon.vocab[i];
      if ($(this).attr('id') == entry['word']) {
        $(this).append('<span class="vocab_bubble">'+entry['translation']+'</span>');
        $('.vocab_bubble').css({
          position: 'absolute',
          width: '200px',
          padding: '5px',
          fontSize: '125%',
          backgroundColor: '#a9caa68',
          zIndex: '100'
        });
        $('.vocab_bubble').hide();
        $('.vocab_bubble').show('fast');
      }
    }
  });
  $('.vocab_bubble_trigger').mouseout(function() {
    $('.vocab_bubble').hide('fast', function() {
      $(this).closest('.vocab_bubble').remove();
    });
  });
});


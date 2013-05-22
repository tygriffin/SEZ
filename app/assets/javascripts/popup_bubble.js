$(document).ready(function() {
  // Set up bubble CSS when page is loaded so bubble info is hidden unless user acts.
  // If JavaScript is turned off bubble info displays normally.
  //
  //

  $('.bubble_wrapper').css('position', 'relative');
  $('.bubble_info').css({
    backgroundColor: '#a9caa68',
    opacity:'0.9',
    position: 'absolute',
    top: '180px',
    left: '10px',
    zIndex: '100'
  });
  $('.bubble_info p, .bubble_info h1').css({
    width: '300px'
  });
  $('.bubble_info').hide();
  $('.bubble_close').css('display', 'block');

  jQuery.easing.def = "easeInOutBack";
});

// Home page popups ////////////////////////////////
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

// Article body popups /////////////////////////////
$(function() {
  $('.article_bubble_trigger').mouseenter(function() {
    //Vocabulary word popup
    for (var i=0; i<gon.vocab.length; i++) {
      var entry = gon.vocab[i];
      if ($(this).attr('id') == entry['word']) {
        $(this).append('<p class="article_bubble">'+entry['translation']+'</p>');
      }
    }
    //Culture note popup
    for (var i=0; i<gon.culture_notes.length; i++) {
      var entry = gon.culture_notes[i];
      if ($(this).attr('id') == entry['title']) {
        $(this).append('<p class="article_bubble">'+entry['body']+'</p>');
      }
    }
    $('.article_bubble').css({
      position: 'fixed',
      bottom: '30px',
      left: '5px',
      fontSize: '150%',
      padding: '5px',
      margin: '0',
      maxWidth: '400px',
      backgroundColor: '#a9caa68',
      zIndex: '100'
    });
    $('.article_bubble').hide();
    $('.article_bubble').show('fast');
  });
  $('.article_bubble_trigger').mouseout(function() {
    $('.article_bubble').hide('fast', function() {
      $(this).closest('.article_bubble').remove();
    });
  });
});


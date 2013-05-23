$(document).ready(function() {
  // Set up bubble CSS when page is loaded so bubble info is hidden unless user acts.
  // If JavaScript is turned off bubble info displays normally.
  //
  //

  $('.bubble_wrapper').css('position', 'relative');
  $('.bubble_info').css({
    backgroundColor: '#6f8500',
    opacity:'0.95',
    position: 'absolute',
    top: '175px',
    left: '5px',
    zIndex: '100'
  });
  $('#latest_blog_posts div.bubble_info').css('background-color', '#953c10')
  $('.bubble_info p, .bubble_info h1, .bubble_info a').css({
    width: '300px',
    color: '#fff'
  });
  $('#latest_blog_posts div.bubble_info').append('<img class="bubble_close" src="/images/close_red.png">');
  $('#latest_articles div.bubble_info, #featured_article div.bubble_info').append('<img class="bubble_close" src="/images/close_green.png">');
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
      opacity: '0.95',
      backgroundColor: '#6f8500',
      color: '#fff',
      zIndex: '200'
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


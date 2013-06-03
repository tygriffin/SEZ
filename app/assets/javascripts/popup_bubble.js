
$(document).ready(function() {
  // Set up bubble CSS when page is loaded so bubble info is hidden unless user acts.
  // If JavaScript is turned off bubble info displays normally.
  //
  //

  $('head').append('<link href="/assets/popup_base.css" media="all" rel="stylesheet" type="text/css" />');
  $('#latest_blog_posts div.bubble_info').append('<img class="bubble_close" src="/images/close_red.png">');
  $('#latest_articles div.bubble_info, #featured_article div.bubble_info').append('<img class="bubble_close" src="/images/close_green.png">');
  $('#vocab').append('<img class="popup_placeholder" src="/images/plus_tab_green.png">');
  $('.bubble_info').hide();

  jQuery.easing.def = "easeInOutBack";


  // Home page popups ////////////////////////////////

  // Hack to compensate for lack of pointer-events in IE

  function passThrough(e) {
    $(".bubble_trigger").each(function() {
     // check if clicked point (taken from event) is inside element
     var mouseX = e.pageX;
     var mouseY = e.pageY;
     var offset = $(this).offset();
     var width = $(this).width();
     var height = $(this).height();

     if (mouseX > offset.left && mouseX < offset.left+width && mouseY > offset.top && mouseY < offset.top+height)
      $(this).click(); // force click event
    });
  }

  $('html').click(passThrough);
  // end hack



  $('.bubble_trigger').click(function(e) {
    e.stopPropagation();
    $('.bubble_info').hide();
    $(this).next().stop().show('fast');
  });

  $('.bubble_close').click(function(e) {
    e.stopPropagation();
    $('.bubble_info').hide('fast');
  });



  // Article body popups /////////////////////////////
  var hide_delay = 0;
  var hide_delay_timer = null;

  $('.article_bubble_trigger').mouseenter(function(e) {
    if (hide_delay_timer) clearTimeout(hide_delay_timer);
    $('.popup_placeholder').stop();
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
      left: '10px',
      fontSize: '130%',
      padding: '5px',
      margin: '0',
      maxWidth: '600px',
      opacity: '0.95',
      backgroundColor: '#6f8500',
      color: '#fff',
      zIndex: '200'
    });
    $('.article_bubble').hide();
    $('.article_bubble').show('fast');
    $('.popup_placeholder').hide();
    $('.article_bubble').mouseover(function() {
      if (hide_delay_timer) clearTimeout(hide_delay_timer);
    })
  }).mouseout(function() {
    if (hide_delay_timer) clearTimeout(hide_delay_timer);
    hide_delay_timer = setTimeout(function() {
      hide_delay_timer = null;
      $('.article_bubble').hide('fast', function() {
        $(this).closest('.article_bubble').remove();
      });
      $('.popup_placeholder').show('fast');
    }, hide_delay);
  });

});


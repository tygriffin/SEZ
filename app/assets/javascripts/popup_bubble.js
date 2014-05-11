$(document).ready(function() {
  // Set up bubble CSS when page is loaded so bubble info is hidden unless user acts.
  // If JavaScript is turned off bubble info displays normally.
  //
  //
  $('#vocab').append('<img class="popup_placeholder" src="/images/plus_tab_green.png">');

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
    //Study note popup
    for (var i=0; i<gon.study_notes.length; i++) {
      var entry = gon.study_notes[i];
      if ($(this).attr('id') == entry['title']) {
        $(this).append('<p class="article_bubble">'+entry['body']+'</p>');
      }
    }
    if ($(this).attr('id') == "help_bubble") {
        $(this).append('<p class="article_bubble">説明文がここに現れます！</p>');
      }
    $('.article_bubble').css({
      position: 'fixed',
      bottom: '30px',
      left: '10px',
      fontSize: '22px',
      padding: '5px',
      margin: '0',
      maxWidth: '600px',
      opacity: '0.95',
      backgroundColor: '#6f8500',
      color: '#fff',
      zIndex: '99999',
      width: 'auto',
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


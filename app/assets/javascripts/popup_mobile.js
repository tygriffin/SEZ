$(document).ready(function() {
  // This script handles popup functionality for article mobile views
  //
  //
  //

  jQuery.easing.def = "easeInOutBack";
});

// Article body popups /////////////////////////////
$(function() {

  $('html').click(function() {
    $('.article_bubble').hide('fast');
  });

  $('.article_bubble_trigger').click(function(e) {
    e.stopPropagation();
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
      bottom: '0',
      left: '0',
      fontSize: '130%',
      padding: '20px',
      margin: '0',
      width: '100%',
      opacity: '0.95',
      backgroundColor: '#6f8500',
      color: '#fff',
      zIndex: '200'
    });
    $('.article_bubble').hide();
    $('.article_bubble').show('fast');
  });
});


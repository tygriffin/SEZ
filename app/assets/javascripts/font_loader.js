$(document).ready(function () {

  $('#archive li, #blog li').css({
    width: '323px'
  });

  WebFontConfig = {
    google: {
      families: ['Chivo']
    },
    active: function() {
      $('#archive, #blog').imagesLoaded(function(){
        $('#archive, #blog').masonry({
            itemSelector : '.item',
            columnWidth: 330,
            gutterWidth: 10
        });
      });
    }
  };

  (function() {
    var wf = document.createElement('script');
    wf.src = ('https:' == document.location.protocol ? 'https' : 'http') +
        '://ajax.googleapis.com/ajax/libs/webfont/1.4.2/webfont.js';
    wf.type = 'text/javascript';
    wf.async = 'true';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(wf, s);
  })();
});
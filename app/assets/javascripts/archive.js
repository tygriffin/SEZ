$(document).ready(function () {
  $('#archive').imagesLoaded(function() {
    $('#archive').masonry({
        itemSelector : '.item',
        columnWidth: 310,
        gutterWidth: 20
    });
  });
});
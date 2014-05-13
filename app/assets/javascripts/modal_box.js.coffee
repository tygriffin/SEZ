$( document ).ready ->

  #show modal
  $( '#help' ).click -> $( '#help-modal' ).fadeIn 600

  #hide modal
  $( '.close' ).click -> $( '#help-modal' ).fadeOut 'slow'

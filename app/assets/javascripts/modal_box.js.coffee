$( document ).ready ->

  #show modal
  $( '#help' ).click -> $( '#help_modal' ).fadeIn 600

  #hide modal
  $( '.close' ).click -> $( '#help_modal' ).fadeOut 'slow'

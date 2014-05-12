$( document ).ready ->

  jQuery.easing.def = "easeInOutBack"

  insertBubble = ( resource, target ) ->
    for entry in resource

      selector = if entry['word']?        then entry['word']        else entry['title']
      display  = if entry['translation']? then entry['translation'] else entry['body']

      if target.attr( 'id' ) == selector
        target.append '<p class="article_bubble">#{display}</p>'

  $( 'html' ).on 'touchstart mousedown', ->
    $( '.article_bubble' ).hide 'fast'
    $( '.article_bubble' ).remove()

  $( '.article_bubble_trigger' ).on 'touchstart', (e) ->
    e.stopPropagation()
    $( '.article_bubble' ).remove()

    insertBubble gon.vocab, $(this)
    insertBubble gon.culture_notes, $(this)
    insertBubble gon.study_notes, $(this)

    $( '.article_bubble' ).css
      position:        'fixed'
      bottom:          '0'
      left:            '0'
      fontSize:        '130%'
      padding:         '20px'
      margin:          '0'
      width:           '100%'
      opacity:         '0.95'
      backgroundColor: '#6f8500'
      color:           '#fff'
      zIndex:          '200'

    $( '.article_bubble p' ).css width: '80%'
    $( '.article_bubble' ).hide()
    $( '.article_bubble' ).show 'fast'



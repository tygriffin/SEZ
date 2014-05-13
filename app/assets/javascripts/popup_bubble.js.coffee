$( document ).ready ->

  jQuery.easing.def = "easeInOutBack"

  $( '.vocab' ).append '<img class="popup-placeholder" src="/images/plus_tab_green.png">'

  hide_delay       = 0
  hide_delay_timer = 0

  insertBubble = ( resources, target ) ->
    for entry in resources
      selector = if entry['word']?        then entry['word']        else entry['title']
      display  = if entry['translation']? then entry['translation'] else entry['body']

      if target.attr( 'id' ) == selector
        target.append "<p class='article-bubble'>#{display}</p>"

  $( '.bubble-trigger' )
    .mouseenter (e) ->
      clearTimeout hide_delay_timer if hide_delay_timer
      $( '.popup-placeholder' ).stop()
      insertBubble gon.vocab, $(this)
      insertBubble gon.culture_notes, $(this)
      insertBubble gon.study_notes, $(this)

      if $(this).attr( 'id' ) == "help-bubble"
        $(this).append '<p class="article-bubble">説明文がここに現れます！</p>'

      $( '.article-bubble' ).css
        position:        'fixed'
        bottom:          '30px'
        left:            '10px'
        fontSize:        '22px'
        padding:         '5px'
        margin:          '0'
        maxWidth:        '600px'
        opacity:         '0.95'
        backgroundColor: '#6f8500'
        color:           '#fff'
        zIndex:          '99999'
        width:           'auto'

      $( '.article-bubble' ).hide()
      $( '.article-bubble' ).show 'fast'
      $( '.popup-placeholder' ).hide()

      $( '.article-bubble' ).mouseover ->
        clearTimeout hide_delay_timer if hide_delay_timer

    .mouseout ->
      clearTimeout hide_delay_timer if hide_delay_timer
      hide_delay_timer = setTimeout ->
        hide_delay_timer = null
        $( '.article-bubble' ).hide 'fast', ->
          $(this).closest( '.article-bubble' ).remove()
        $( '.popup-placeholder' ).show 'fast'
      , hide_delay



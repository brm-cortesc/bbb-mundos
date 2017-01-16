jQuery(document).ready ($) ->

  ### Iniciar Juego/map ###

  $('.start')
    .click (e) ->
      e.preventDefault()
      toggleFullScreen()

      animBase('.container-counter', '.container-iniciar')

      $('.circle-steps')
        .velocity('fadeOut')

      ### activamos mapa ###

      $('#map').addClass 'play'

      ### Iniciamos contador ###

      counter(30, '.container-counter')
      return

  return

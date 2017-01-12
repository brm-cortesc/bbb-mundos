jQuery(document).ready ($) ->

  ### Iniciar Juego/map ###

  $('.start')
    .click (e) ->
      e.preventDefault()

      animBase('.container-counter', '.container-iniciar')

      $('.circle-steps')
        .velocity('fadeOut')

      ### activamos mapa ###

      $('#map').addClass 'play'

      ### Iniciamos contador ###

      counter(12, '.container-counter')


      return

  return

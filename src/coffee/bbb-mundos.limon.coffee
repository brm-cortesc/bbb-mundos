jQuery(document).ready ($) ->

  ### Iniciar Juego/map ###

  $('.start')
    .click (e) ->
      e.preventDefault()

      window.anim('.container-counter', '.container-iniciar')

      $('.circle-steps')
        .velocity('fadeOut')

      ### activamos mapa ###

      $('#map').addClass 'play'

      ### Iniciamos contador ###

      window.counter(30, '.container-counter')


      return

  return

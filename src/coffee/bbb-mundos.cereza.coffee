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

      counter(12, '.container-counter')
      return

    ### Control del Zoom ###
    $('.zoom-controls a')
      .click (e) ->
        e.preventDefault()

        if $(this).hasClass('btn-zoom-in')
          zoom = 4
          console.log zoom

        return

    console.log map

  return

### Add event to watch orientation ###
mql = window.matchMedia('(orientation: portrait)')

### Animacion base de entrada y salida de elementos ###
animBase = (el1,el2) ->
  $(el1)
    .velocity('fadeIn', {
      duration: 500,
      easing: 'ease'

    })

  $(el2)
    .velocity('fadeOut',{
      queue: false,
      display:'none'
    })


  return


### Init de contador ###
counter = (time, el) ->
  ## Armamos intervalo ###
  timer =
    setInterval ->
      ### Restamos 1 segundo ###
      time--

      ### Validamos para agregar 0 ###
      if time >= 10
        $(el + ' .clock-text').text('00:'+ time)

      else
        $(el + ' .clock-text').text('00:0'+ time)

      ten()
      stop()
      return
    , 1000

  ### Alerta de ultimos 10 segundos ###
  ten = ->
    if time == 10
      $(el).addClass 'last-ten'
      return

  ### Limpiamos el intervalo, paramos conteo y enviamos a visual de resultados ###
  stop = ->
    if time <= 0
      console.log 'para ' + time
      clearInterval timer
      animBase('.time-over', '.container-counter')
      $('#map').removeClass 'play'

      ### Lo enviamos a la página de resultados ###
      setTimeout ->
        window.location.href = '/resultados.html'
        return
      , 2000

    return

  return
### Funcion para fullscreen ###
toggleFullScreen =  ->
  if document.fullScreenElement && document.fullScreenElement != null or !document.mozFullScreen and !document.webkitIsFullScreen
    if document.documentElement.requestFullScreen
      ### normal function ###
      document.documentElement.requestFullScreen()

    else if document.documentElement.mozRequestFullScreen
      ### pointing moz  ###
      document.documentElement.mozRequestFullScreen()

    else if document.documentElement.webkitRequestFullScreen
      ### pointing webkit  ###
      document.documentElement.webkitRequestFullScreen(Element.ALLOW_KEYBOARD_INPUT)

  else
    if document.cancelFullScreen
      document.cancelFullScreen()

    else if document.mozCancelFullScreen
      document.mozCancelFullScreen()

    else if document.webkitCancelFullScreen
      document.webkitCancelFullScreen()

  return

jQuery(document).ready ($) ->
  splash = $('.lock')
  ### Identificar orientacion ###
  if mql.matches
    console.log 'vertical'
    splash.removeClass('hidden')
    $('body').addClass 'body-lock'

  else
    console.log 'landscape'
    splash.addClass('hidden')
    $('body').removeClass 'body-lock'

  ### identificar si cambio orientación ###
  mql.addListener (m) ->

    if m.matches
      console.log 'cambio a vertical'
      splash.removeClass('hidden')
      $('body').addClass 'body-lock'
      return


    else
      console.log 'cambio a landscape'
      splash.addClass('hidden')
      $('body').removeClass 'body-lock'
      return


  ### Show start ###
  $('.container-home a.btn')
    .click (e) ->
      e.preventDefault()

      animBase('.circle-select', '.circle-intro')

      $('.divider a')
        .velocity('fadeIn',{
          queue:false,
          duration: 500
        })

      $('.divider').addClass('active')


      return false


  ### Animacion de cada zona en hover ###
  divider = $('.divider')

  # divider.mouseover ->
  divider.mouseover ->

    if $(@).hasClass('active')

      divider.addClass 'no-hover'
      $(@).removeClass 'no-hover'
      $(@).addClass 'hover'

      if $(@).hasClass('divider-left')
        $('.container-divider, .circle-select').removeClass('hover-l hover-r')
        $('.container-divider, .circle-select').addClass('hover-l')

      else
        $('.container-divider, .circle-select').removeClass('hover-l hover-r')
        $('.container-divider, .circle-select').addClass('hover-r')

    return

  divider.mouseout ->
    if $(@).hasClass('active')
      $('.container-divider, .circle-select').removeClass('hover-l hover-r')
      divider.removeClass('hover no-hover')
    return

  ### Animacion de seleccion de seccion ###
  $('.divider a')
    .click (e) ->
      e.preventDefault()
      ### Validacion de izquerda/derecha ###
      if $(@).parent().hasClass 'divider-right'

        ### Clases para poner a correr animacion ###
        $(@).parent().removeClass 'hover no-hover'
        $(@).parent().addClass('selected')
        $(@).parent().parent().find('.divider-left').addClass('no-selected')
        $('.container-divider').addClass('selected-r')

        ### Ocultamos circulo del medio ###
        $('.circle-select')
          .velocity('fadeOut')

        ### Lo direccionamos al mapa correspondiente ###
        setTimeout ->
          window.location.href = '/limon.html'
          return
        ,2100

      else if $(@).parent().hasClass 'divider-left'
        $(@).parent().addClass('selected')
        $(@).parent().parent().find('.divider-right').addClass('no-selected')

        $('.container-divider').addClass('selected-l')

        $('.circle-select')
          .velocity('fadeOut')

        ### Lo direccionamos al mapa correspondiente ###
        setTimeout ->
          window.location.href = '/cereza.html'
          return
        ,2100


      return

  ### Mostramos Compartir en Facebook ###
  $('.icon-fb')
    .click (e) ->
      e.preventDefault()
      $('.social-fb, .share-score ').toggleClass 'active'
      return



  return

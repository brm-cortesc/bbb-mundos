### Add event to watch orientation ###

mql = window.matchMedia('(orientation: portrait)')

jQuery(document).ready ($) ->
  splash = $('.lock')
  ### Identificar orientacion ###
  if mql.matches
    console.log 'vertical'
    splash.removeClass('hidden')

  else
    console.log 'landscape'
    splash.addClass('hidden')

  ### identificar si cambio orientación ###
  mql.addListener (m) ->

    if m.matches
      console.log 'cambio a vertical'
      splash.removeClass('hidden')


    else
      console.log 'cambio a landscape'
      splash.addClass('hidden')


  return

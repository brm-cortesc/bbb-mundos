jQuery(document).ready ($) ->
  $('.btn-restart')
    .click (e) ->
      console.log 'start'
      e.preventDefault()

      window.anim('.circle-select', '.circle-resultado')

      $('.divider a')
        .velocity('fadeIn',{
          queue:false,
          duration: 500
        })

      $('.divider').addClass('active')


      return false
  return

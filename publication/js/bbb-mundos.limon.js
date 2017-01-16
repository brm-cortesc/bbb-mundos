jQuery(document).ready(function($) {

  /* Iniciar Juego/map */
  $('.start').click(function(e) {
    e.preventDefault();
    toggleFullScreen();
    animBase('.container-counter', '.container-iniciar');
    $('.circle-steps').velocity('fadeOut');

    /* activamos mapa */
    $('#map').addClass('play');

    /* Iniciamos contador */
    counter(30, '.container-counter');
  });
});

//# sourceMappingURL=../maps/bbb-mundos.limon.js.map

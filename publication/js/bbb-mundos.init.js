
/* Add event to watch orientation */
var animBase, counter, mql, toggleFullScreen, zoom;

mql = window.matchMedia('(orientation: portrait)');

zoom = 3;


/* Animacion base de entrada y salida de elementos */

animBase = function(el1, el2) {
  $(el1).velocity('fadeIn', {
    duration: 500,
    easing: 'ease'
  });
  $(el2).velocity('fadeOut', {
    queue: false,
    display: 'none'
  });
};


/* Init de contador */

counter = function(time, el) {
  var stop, ten, timer;
  timer = setInterval(function() {

    /* Restamos 1 segundo */
    time--;

    /* Validamos para agregar 0 */
    if (time >= 10) {
      $(el + ' .clock-text').text('00:' + time);
    } else {
      $(el + ' .clock-text').text('00:0' + time);
    }
    ten();
    stop();
  }, 1000);

  /* Alerta de ultimos 10 segundos */
  ten = function() {
    if (time === 10) {
      $(el).addClass('last-ten');
    }
  };

  /* Limpiamos el intervalo, paramos conteo y enviamos a visual de resultados */
  stop = function() {
    if (time <= 0) {
      console.log('para ' + time);
      clearInterval(timer);
      animBase('.time-over', '.container-counter');
      $('#map').removeClass('play');

      /* Lo enviamos a la página de resultados */
      setTimeout(function() {
        window.location.href = 'resultados.html';
      }, 2000);
    }
  };
};


/* Funcion para fullscreen */

toggleFullScreen = function() {
  if (document.fullScreenElement && document.fullScreenElement !== null || !document.mozFullScreen && !document.webkitIsFullScreen) {
    if (document.documentElement.requestFullScreen) {

      /* normal function */
      document.documentElement.requestFullScreen();
    } else if (document.documentElement.mozRequestFullScreen) {

      /* pointing moz */
      document.documentElement.mozRequestFullScreen();
    } else if (document.documentElement.webkitRequestFullScreen) {

      /* pointing webkit */
      document.documentElement.webkitRequestFullScreen(Element.ALLOW_KEYBOARD_INPUT);
    }
  } else {
    if (document.cancelFullScreen) {
      document.cancelFullScreen();
    } else if (document.mozCancelFullScreen) {
      document.mozCancelFullScreen();
    } else if (document.webkitCancelFullScreen) {
      document.webkitCancelFullScreen();
    }
  }
};


/* Cargador */

jQuery(window).load(function() {
  $('.loader').velocity('fadeOut', {
    complete: function() {
      $('.loader').remove();
    }
  });
});

jQuery(document).ready(function($) {
  var divider, splash;
  splash = $('.lock');

  /* Identificar orientacion */
  if (mql.matches) {
    console.log('vertical');
    splash.removeClass('hidden');
    $('body').addClass('body-lock');
  } else {
    console.log('landscape');
    splash.addClass('hidden');
    $('body').removeClass('body-lock');
  }

  /* identificar si cambio orientación */
  mql.addListener(function(m) {
    if (m.matches) {
      console.log('cambio a vertical');
      splash.removeClass('hidden');
      $('body').addClass('body-lock');
    } else {
      console.log('cambio a landscape');
      splash.addClass('hidden');
      $('body').removeClass('body-lock');
    }
  });

  /* Texto home si es mobile */
  if ($(window).width() <= 768) {

    /* Primer texto */
    $('.container-home .circle-intro p:nth-of-type(1)').velocity({
      opacity: 1,
      translateY: '+=8rem'
    }, {
      display: 'block',
      delay: 1000,
      complete: function() {
        setTimeout(function() {
          $('.container-home .circle-intro p:nth-of-type(1)').velocity('reverse');
        }, 3000);
      }
    });

    /* img */
    $('.container-home .circle-intro img').velocity({
      opacity: 1,
      translateY: '+=1.2rem',
      scale: '2'
    }, {
      display: 'inline',
      delay: 4500,
      complete: function() {
        setTimeout(function() {
          $('.container-home .circle-intro img').velocity('reverse');
        }, 3000);
      }
    });

    /* texto 2 */
    $('.container-home .circle-intro p:nth-of-type(2)').velocity({
      opacity: 1,
      translateY: '-=2rem'
    }, {
      display: 'block',
      delay: 8000,
      complete: function() {
        setTimeout(function() {
          $('.container-home .circle-intro p:nth-of-type(2').velocity('reverse');
        }, 5000);
      }
    });

    /* Btn CTA */
    $('.container-home .circle-intro a.btn').velocity({
      opacity: 1,
      translateY: '-=6.5rem'
    }, {
      display: 'block',
      delay: 13500
    });
  }

  /* Show start */
  $('.container-home a.btn').click(function(e) {
    e.preventDefault();
    animBase('.circle-select', '.circle-intro');
    $('.divider a').velocity('fadeIn', {
      queue: false,
      duration: 500
    });
    $('.divider').addClass('active');
    return false;
  });

  /* Animacion de cada zona en hover */
  divider = $('.divider');
  divider.mouseover(function() {
    if ($(this).hasClass('active')) {
      divider.addClass('no-hover');
      $(this).removeClass('no-hover');
      $(this).addClass('hover');
      if ($(this).hasClass('divider-left')) {
        $('.container-divider, .circle-select').removeClass('hover-l hover-r');
        $('.container-divider, .circle-select').addClass('hover-l');
      } else {
        $('.container-divider, .circle-select').removeClass('hover-l hover-r');
        $('.container-divider, .circle-select').addClass('hover-r');
      }
    }
  });
  divider.mouseout(function() {
    if ($(this).hasClass('active')) {
      $('.container-divider, .circle-select').removeClass('hover-l hover-r');
      divider.removeClass('hover no-hover');
    }
  });

  /* Animacion de seleccion de seccion */
  $('.divider a').click(function(e) {
    e.preventDefault();

    /* Validacion de izquerda/derecha */
    if ($(this).parent().hasClass('divider-right')) {

      /* Clases para poner a correr animacion */
      $(this).parent().removeClass('hover no-hover');
      $(this).parent().addClass('selected');
      $(this).parent().parent().find('.divider-left').addClass('no-selected');
      $('.container-divider').addClass('selected-r');

      /* Ocultamos circulo del medio */
      $('.circle-select').velocity('fadeOut');

      /* Lo direccionamos al mapa correspondiente */
      setTimeout(function() {
        window.location.href = 'limon.html';
      }, 2100);
    } else if ($(this).parent().hasClass('divider-left')) {
      $(this).parent().addClass('selected');
      $(this).parent().parent().find('.divider-right').addClass('no-selected');
      $('.container-divider').addClass('selected-l');
      $('.circle-select').velocity('fadeOut');

      /* Lo direccionamos al mapa correspondiente */
      setTimeout(function() {
        window.location.href = 'cereza.html';
      }, 2100);
    }
  });

  /* Mostramos Compartir en Facebook */
  $('.icon-fb').click(function(e) {
    e.preventDefault();
    $('.social-fb, .share-score ').toggleClass('active');
  });
});

//# sourceMappingURL=../maps/bbb-mundos.init.js.map

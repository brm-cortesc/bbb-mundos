jQuery(document).ready(function($) {
  $('.btn-restart').click(function(e) {
    e.preventDefault();
    animBase('.circle-select', '.circle-resultado');
    $('.divider a').velocity('fadeIn', {
      queue: false,
      duration: 500
    });
    $('.divider').addClass('active');
    return false;
  });
});

//# sourceMappingURL=../maps/bbb-mundos.resultados.js.map

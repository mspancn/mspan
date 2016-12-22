$(window).resize(function () {
  const w = $('.main-card').width();
  if (w < 500) {
    $(".main-card .info").addClass("hidden");
  } else {
    $(".main-card .info").removeClass("hidden");
  }
});

$(document).on('turbolinks:load', function() {
  $(window).resize();
});
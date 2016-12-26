$(document).ready(function(){
  $('#expandAll').change(function() {
    if (this.checked) {
      $('.collapsable').collapse('show');
    }else{
      $('.collapsable').collapse('hide');
    }
  });

  $('.collapsable').on("hide.bs.collapse", function(){
    $(this).prev().first().find('button').html('<span class="fa fa-chevron-down"></span>');
  });

  $('.collapsable').on("show.bs.collapse", function(){
    $(this).prev().first().find('button').html('<span class="fa fa-chevron-up"></span>');
  });
});

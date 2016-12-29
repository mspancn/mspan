$(document).on('turbolinks:load', function () {
  $('#teachers').DataTable({
    ajax: $('#teachers').data("ajax"),
    columns: [
      { data: 'first_name' },
      { data: 'last_name' },
      { data: 'email' }
    ]
  });
});

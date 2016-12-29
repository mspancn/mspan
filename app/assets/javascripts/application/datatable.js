$(document).on('turbolinks:load', function () {
  const url = $('#teachers').data("ajax");

  const table = $('#teachers').DataTable({
    ajax: url,
    columns: [
      { data: 'first_name' },
      { data: 'last_name' },
      { data: 'email' }
    ]
  });

  $('#teachers tbody').on('click', 'tr', function() {
    let data = table.row(this).data();
    window.location.href = url + "/" + data["id"] + "/edit"
  });
});

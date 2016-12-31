$(document).on('turbolinks:load', function () {
  const url = $('#teachers').data("ajax");

  const table = $('#teachers').DataTable({
    ajax: url,
    columns: [
      { data: 'first_name' },
      { data: 'last_name' },
      { data: 'email' },
      { data: 'notes' },
      {
        data: 'active',
        render: function(data, type, full, meta) {
          return data ? "Yes" : "No";
        }
      }
    ]
  });

  $('#teachers tbody').on('click', 'tr', function() {
    const data = table.row(this).data();
    window.location.href = url + "/" + data["id"] + "/edit"
  });
});

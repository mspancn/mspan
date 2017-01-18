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

$(document).on('turbolinks:load', function () {
  const url = $('#students-table').data("ajax");

  const table = $('#students-table').DataTable({
    ajax: url,
    columns: [
      { data: 'full_name' },
      { data: 'email' },
      { data: 'notes' }
    ]
  });

  $('#students-table tbody').on('click', 'tr', function() {
    const data = table.row(this).data();
    window.location.href = url + "/" + data["id"] + "/edit"
  });
});

$(document).on('turbolinks:load', function () {
  const url = $('#appointments-table').data("ajax");

  const table = $('#appointments-table').DataTable({
    ajax: url,
    columns: [
      { data: 'student_email' },
      { data: 'teacher_email' },
      {
        data: 'scheduled_start',
        render: function(data, type, full, meta) {
          return new Date(data).toLocaleString();
        }
      },
      { data: 'state' }
    ]
  });
});

$(document).on('turbolinks:load', function () {
  const url = $('#teacher-payments-table').data("ajax");

  const table = $('#teacher-payments-table').DataTable({
    ajax: url,
    columns: [
      { data: 'teacher_email' },
      { data: 'amount' },
      {
        data: 'created_at',
        render: function(data, type, full, meta) {
          return new Date(data).toLocaleDateString("en-US");
        }
      },
      { data: 'creator_email' }
    ]
  });
});

$(document).on('turbolinks:load', function() {
  $('#preview-calendar').fullCalendar({
    "defaultView":"agendaWeek",
    "firstDay":0,
    "header": false,
    "allDaySlot": false,
    "selectable": false,
    eventSources: [
      {
        events: $('#preview-calendar').data("availabilities"),
        color: '#8DC63B',
        textColor: 'white'
      }
    ],
    "slotDuration": "01:00:00",
    "minTime": $('#preview-calendar').data("mintime"),
    "maxTime": $('#preview-calendar').data("maxtime"),
    "height": 'auto'
  });
});

$(document).on('turbolinks:load', function() {
  $('#editable-calendar').fullCalendar({
    "defaultView":"agendaWeek",
    "firstDay":0,
    "allDaySlot": false,
    "selectable": true,
    "select": function(start, end){
      $.ajax({
        url: '/teacher/availabilities',
        dataType: 'json',
        method: 'POST',
        data: {
          start: start.unix(),
          end: end.unix()
        },
        success: function(json) {
          alert(json.availability);
        }
      });
    },
    eventSources: [
      {
        url: '/teacher/availabilities',
        type: 'GET',
        dataType: 'json',
        error: function() {
          alert('there was an error while fetching events!');
        },
        color: '#8DC63B',
        textColor: 'white'
      }
    ],
    "slotDuration": "01:00:00",
    "height": 'auto'
  });
});

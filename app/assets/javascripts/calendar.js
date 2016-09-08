$(document).on('turbolinks:load', function() {
  $('#preview-calendar').fullCalendar({
    "defaultView":"agendaWeek",
    "firstDay": $('#preview-calendar').data("today"),
    "header": false,
    "allDaySlot": false,
    "selectable": false,
    eventSources: [
      {
        events: $('#preview-calendar').data("availabilities"),
        color: '#8DC63B'
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
          if (json.status == 200) {
            $('#editable-calendar').fullCalendar( 'renderEvent', $.extend({}, json.availability, {color: '#8DC63B'}), true);
          } else {
            alert("Error. Please try again later.");
          }
        },
        error: function(json) {
          alert("Error. Please try again later.");
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
    eventRender: function(event, element) {
      $(element).tooltip({ title: "Click delete", placement: "right" });
    },
    eventClick: function(event, element) {
      $('.tooltip').hide();
      $.ajax({
        url: '/teacher/availabilities/' + event.id,
        method: 'DELETE',
        success: function(json) {
          if (json.status == 200) {
            $('#editable-calendar').fullCalendar('removeEvents',event._id);
          } else {
            alert("Error. Please try again later.");
          }
        },
        error: function(json) {
          alert("Error. Please try again later.");
        }
      });
    },
    "slotDuration": "01:00:00",
    "height": 'auto'
  });
});

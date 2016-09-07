$(document).on('turbolinks:load', function() {
  $('#preview-calendar').fullCalendar({
    "defaultView":"agendaWeek",
    "firstDay":0,
    "header": false,
    "allDaySlot": false,
    "selectable": false,
    "slotDuration": "01:00:00",
    "minTime": "09:00:00",
    "maxTime": "18:00:00",
    "height": 220
  });
});

$(document).on('turbolinks:load', function() {
  $('#editable-calendar').fullCalendar({
    "defaultView":"agendaWeek",
    "firstDay":0,
    "allDaySlot": false,
    "selectable": true,
    "select": function(start,end){
      alert("start: " + start + "; end: " + end);
    },
    "slotDuration": "01:00:00",
    "height": 593
  });
});

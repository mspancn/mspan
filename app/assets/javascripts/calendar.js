$(document).on('turbolinks:load', function() {
  $('#preview-calendar').fullCalendar({
    "defaultView":"agendaWeek",
    "firstDay":0,
    "header": false,
    // "selectable": true,
    "allDaySlot": false,
    "slotDuration": "01:00:00",
    "minTime": "09:00:00",
    "maxTime": "18:00:00",
    "height": 220
  });
});
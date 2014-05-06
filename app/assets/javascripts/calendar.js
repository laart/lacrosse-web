$(document).ready(function() {

    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();

    $('#calendar').fullCalendar({
       
        // editable: false,
        // selectable: false,
        // selectHelper: false,

        eventSources: [{
            url: '/events',
            ignoreTimezone: true
        }],

        timeFormat: 'HH:mm{ - HH:mm}',

        // dragOpacity: "0.5",

        // select: function(start, end, allDay){
        //  window.location.replace("/events/new"+"?start="+start);
        // },

      // http://arshaw.com/fullcalendar/docs/mouse/eventClick/
      eventClick: function(event, jsEvent, view){
          // window.location.replace("/events/"+event.id+"/edit");
          alert(event.title);
      },

    });
});



// function updateEvent(the_event){
//  $.ajax({
//      type: 'put',
//      url: "/events/" + the_event.id,
//          headers: {
//       'X-Transaction': 'put',
//       'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
//     },
//     data:
//     {
//      event: {
//          title: the_event.title,
//          start_time: "" + the_event.start,
//          end_time: "" + the_event.end,
//          type: the_event.type
//      }
//     },
//     complete: function (response) { }
//  });
// };

// function addEvent(the_event){
//  $.ajax({
//      type: 'post',
//      url: "/events/",
//      headers: {
//       'X-Transaction': 'POST',
//       'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
//     },
//     data:
//     {
//      event: {
//          title: the_event.title,
//          start_time: "" + the_event.start,
//          end_time: "" + the_event.end,
//          type: the_event.type
//      }
//     },
//     complete: function (response) { }
//  });
// };
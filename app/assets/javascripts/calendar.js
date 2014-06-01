$(document).ready(function() {

    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();
  
    $('#calendar').fullCalendar({

        eventSources: [{
          url: '/events',
          ignoreTimezone: true
        }],

        timeFormat: 'HH:mm{ - HH:mm}',

        buttonText: {
          today: 'šodiena',
          month: 'mēnesis',
          week: 'nedēļa',
          day: 'diena'
        },

        monthNames: [
          'Janvāris', 'Februāris', 'Marts', 'Aprīlis', 'Maijs', 'Jūnijs', 
          'Jūlijs', 'Augusts', 'Septembris', 'Oktobris', 'Novemberis', 'Decembris'
        ],

        dayNames: [
          'Svētdiena', 'Pirmdiena', 'Otrdiena', 'Trešdiena',
          'Ceturtdiena', 'Piektdiena', 'Sestdiena'
        ],

        dayNamesShort: [ 
          'Sv', 'Pr', 'Ot', 'Tr', 'Ce', 'Pk', 'Se'
        ],

        eventRender: function (event, element) {
            element.popover({
              placement:'auto',
              html:true,
              trigger : 'hover',
              animation : 'true',
              content : event.description,
              container : '#calendar'
            });
            $('body').on('click', function (e) {
              if (!element.is(e.target) && element.has(e.target).length === 0 && $('.popover').has(e.target).length === 0)
                    element.popover('hide');
            });
        },

    });
});
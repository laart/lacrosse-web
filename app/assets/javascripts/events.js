$(document).ready(function() {

	//Show and hide repeating events input fields in event new_event view
  $("#repeating_event").change(function() {
      if(this.checked) {
        $("#repeating-event-container").show();
      } else {
        $("#repeating-event-container").hide();
        $("#event_repeating_event_title").val('');
        $("#event_period").val('Does not repeat');
        $("#event_frequency").val('1');
        $("span#event-freaquency").text("");
      }
  });

  //Change repeating event frequency text when repeating period changes
  $("#event_period").change(function() {

    switch($(this).val()) {
    case "Does not repeat":
      $("span#event-freaquency").text("");
      break;
    case "Daily":
      $("span#event-freaquency").text("dienu");
      break;
    case "Weekly":
      $("span#event-freaquency").text("nedēļu");
      break;
    case "Monthly":
      $("span#event-freaquency").text("mēnesi");
      break;
    case "Yearly":
      $("span#event-freaquency").text("gadu");
      break;
    default:
      $("span#event-freaquency").text("");
    }

  });

  //Hide repeating event fields, when editing single event
  if($(".edit_event").length > 0){
    $(".repeating-event-checkbox").hide();
    $("#repeating-event-container").hide();
  }

  //Check if event.starttime is less than event.endtime
  jQuery.validator.addMethod("timeCheck", function (value, element) {
      var startDateTime = new Date($("#event_starttime").val());
      var endDateTIme = new Date($("#event_endtime").val());
      return startDateTime < endDateTIme;
  },'Beigu laikam jābūt Lielākam par Sākuma laiku');


  //New event validations
  $("#new_event").validate({
    rules: {

      "event[endtime]": {
        timeCheck: true,
        required: true
      },

      "event[repeating_event_title]": {
        required: "#repeating_event:checked"
      },
      "event[title]": "required",
      "event[starttime]": "required"
    }
  });

  //Edit event validations
  $(".edit_event").validate({
    rules: {
      "event[endtime]": {
        timeCheck: true,
        required: true
      }, 
      "event[title]": "required",
      "event[starttime]": "required"   
    }
  });

  $("#event_starttime").datetimepicker();
  $("#event_endtime").datetimepicker();

});
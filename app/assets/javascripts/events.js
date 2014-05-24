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
      }
  });

});
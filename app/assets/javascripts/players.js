//Show player-hover div on player photo hover
$( document ).ready(function() {

	var id;
	var element;
	var img_hover;

	$( "li.player-photos-list" ).hover(
		function() {
			id = $(this).attr("id");
			element = "#"+id+".player-hover";
			img_hover = "#"+id+" a"+" img";

			$(element).fadeIn("slow").css("display", "inline-block");
			$(img_hover).css("background", "#80276c");
		},
		function(){
			$(element).fadeOut("slow");
			$(img_hover).css("background", "#F8F7F3");
		}
	);

});
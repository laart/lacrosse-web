$(document).ready(function() {
//Form jQuery validations
	$("#new_comment").validate({
	  rules: {
	    "comment[name]": "required",

	    "comment[email]": {
	      required: true,
	      email: true
	    },
	    
	    "comment[message]": "required"    
	  }
	});
	
	$("#contact-form").validate({
	  rules: {
	    "inquiry[name]": "required",

	    "inquiry[email]": {
	      required: true,
	      email: true
	    },
	    
	    "inquiry[message]": "required"    
	  }
	});

	$("#new-player-form").validate({
	  rules: {
	    "new_player_inquiry[name]": "required",
	    "new_player_inquiry[surname]": "required",
	    "new_player_inquiry[age]": {
	    	required: true,
	    	number: true
	    },

	    "new_player_inquiry[phone]": {
	    	required: true,
	    	number: true
	    },

	    "new_player_inquiry[email]": {
	      required: true,
	      email: true
	    },
	    
	    "new_player_inquiry[experience]": "required"    
	  }
	});


	hideGalleryPagination();
});


//Hide Galleries Pagination if videos tab is selected
function hideGalleryPagination(){
		$( "ul.sort-source li a" ).click(function() {

		if ( $(this).parent().attr('data-option-value') == ".format-gallery" ) {
			$(".will-paginate-galleries").show();
		};

		if ( $(this).parent().attr('data-option-value') == ".format-video" ) {
			$(".will-paginate-galleries").hide();
		};

	});
};
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

});

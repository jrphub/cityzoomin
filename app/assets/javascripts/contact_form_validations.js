/**
 * @author lipu
 */
function contact () {
	Placeholders.init();
	// hide messages 
	$("#contact_error").hide();
	//$("#success").hide();
	var form = $("#contact");
	// on submit...
	form.submit(function() {
		$("#contact_error").hide();
		
		var name = $("input#page_username").val();
		if(name == "" || name == "Your name please"){
			$("#contact_error").fadeIn().text("Name required.");
			$("input#page_username").focus();
			return false;
		}
		
		// email
		var email = $("#page_email").val();
		
		if(email == "" || email == "Your email id please"){
			$("#contact_error").fadeIn().text("Email required");
			$("input#page_email").focus();
			return false;
		}
		//email regex
		function isValidEmailAddress(emailAddress) {
    		var pattern = new RegExp(/^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/);
    		return pattern.test(emailAddress);
		};
		
		if(!isValidEmailAddress(email)) {
	    	$("#contact_error").fadeIn().text("Email should contain only alphanumeric characters,domain and +_-.");
			$("input#page_email").focus();
			return false;
		}
		
		var text = $("input#page_description").val();
		if(text == "" || text == "Description"){
			$("#contact_error").fadeIn().text("Description required");
			$("input#page_description").focus();
			return false;
		}
		
	});  
    return false;
}

function feedback () {
	// hide messages 
	$("#feedback_error").hide();
	//$("#success").hide();
	var form = $("#feedback");
	// on submit...
	form.submit(function() {
		$("#feedback_error").hide();
		
		var name = $("input#page_username").val();
		if(name == "" || name == "Your name please"){
			$("#contact_error").fadeIn().text("Name required.");
			$("input#page_username").focus();
			return false;
		}
		
		// email
		var email = $("#page_email").val();
		
		if(email == "" || email == "Your email id please"){
			$("#contact_error").fadeIn().text("Email required");
			$("input#page_email").focus();
			return false;
		}
		//email regex
		function isValidEmailAddress(emailAddress) {
    		var pattern = new RegExp(/^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/);
    		return pattern.test(emailAddress);
		};
		
		if(!isValidEmailAddress(email)) {
	    	$("#contact_error").fadeIn().text("Email should contain only alphanumeric characters,domain and +_-.");
			$("input#page_email").focus();
			return false;
		}
		
		var text = $("input#page_description").val();
		if(text == "" || text == "Description"){
			$("#contact_error").fadeIn().text("Description required");
			$("input#page_description").focus();
			return false;
		}
		
	});  
    return false;
}


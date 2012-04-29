/**
 * @author lipu
 */
$(document).ready(function(){
	// hide messages 
	$("#error").hide();
	$("#success").hide();
	var form = $("#new_user");
	// on submit...
	form.submit(function() {
		$("#error").hide();
		
		//required:
		
		// email
		var email = $("input#user_email").val();
		if(email == ""){
			$("#error").fadeIn().text("Email required");
			$("input#user_email").focus();
			return false;
		}
		//email regex
		function isValidEmailAddress(emailAddress) {
    		var pattern = new RegExp(/^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/);
    		return pattern.test(emailAddress);
		};
		
		if(!isValidEmailAddress(email)) {
	    	$("#error").fadeIn().text("Email should contain only alphanumeric characters and +_-.");
			$("input#user_email").focus();
			return false;
		}
		// password
		var password = $("input#user_password").val();
		if(password == ""){
			$("#error").fadeIn().text("Password required");
			$("input#user_password").focus();
			return false;
		}
		
		
	});  
    return false;
});


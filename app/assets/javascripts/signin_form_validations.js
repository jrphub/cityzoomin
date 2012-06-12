/**
 * @author lipu
 */
$(document).ready(function(){
	// hide messages 
	$("#error").hide();
	//$("#success").hide();
	var form = $("#session_user");
	// on submit...
	form.submit(function() {
		$("#error").hide();
		
		// email
		var email = $("#session_email").val();
		
		if(email == "" || email == "Email"){
			$("#error").fadeIn().text("Email required");
			$("input#session_email").focus();
			return false;
		}
		//email regex
		function isValidEmailAddress(emailAddress) {
    		var pattern = new RegExp(/^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/);
    		return pattern.test(emailAddress);
		};
		
		if(!isValidEmailAddress(email)) {
	    	$("#error").fadeIn().text("Email should contain only alphanumeric characters and +_-.");
			$("input#session_email").focus();
			return false;
		}
		// password
		var password = $("#session_password").val();
		if(password == ""){
			$("#error").fadeIn().text("Password required");
			$("input#session_password").focus();
			return false;
		}
		
		
	});  
    return false;
});


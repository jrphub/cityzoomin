$(document).ready(function(){
	// hide messages 
	$("#error").hide();
	$("#success").hide();
	var form = $("#new_user");
	// on submit...
	form.submit(function() {
		$("#error").hide();
		
		//required:
		
		//name
		var name = $("input#user_name").val();
		if(name == ""){
			$("#error").fadeIn().text("Name required.");
			$("input#user_name").focus();
			
			return false;
		}
		
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
		//passowrd length validation
		if (password.length <6) {
			$("#error").fadeIn().text("Password should have minimum 6 characters");
			$("input#user_password").focus();
			return false;
		}
		// confirm password
		var c_password = $("input#user_password_confirmation").val();
		if(c_password == ""){
			$("#error").fadeIn().text("Re-enter Password");
			$("input#user_password_confirmation").focus();
			return false;
		}
		
		if (password != c_password) {
			$("#error").fadeIn().text("Mismatch password");
			$("input#user_password_confirmation").focus();
			return false;
		}
		
		
		
		/*
		// send mail php
				var sendMailUrl = $("#sendMailUrl").val();
				
				//to, from & subject
				var to = $("#to").val();
				var from = $("#from").val();
				var subject = $("#subject").val();
				
				// data string
				var dataString = 'name='+ name
								+ '&email=' + email        
								+ '&web=' + web
								+ '&comments=' + comments
								+ '&to=' + to
								+ '&from=' + from
								+ '&subject=' + subject;						         
				// ajax
				$.ajax({
					type:"POST",
					url: sendMailUrl,
					data: dataString,
					success: success()
				});*/
		
	});  
		
		
	/*
	// on success...
		 function success(){
			 $("#success").fadeIn();
			 $("#contactForm").fadeOut();
		 }*/
	
	
    return false;
});


$(document).ready(function(){
	// hide messages 
	$("#error").hide();
	//$("#success").hide();
	var form = $("#new_micropost");
	// on submit...
	form.submit(function() {
		$("#error").hide();
		var name = $("input#micropost_location").val();
		if(name == "" || name == null){
			$("#error").fadeIn().text("Please provide particular location");
			$("input#location").focus();
			
			return false;
		}
		
		var title = $("input#micropost_title").val();
		if(title == "" || title == null){
			$("#error").fadeIn().text("Title required");
			$("input#title").focus();
			return false;
		}
		
		var category = $("input#micropost_category").val();
		if(category == "" || category == null){
			$("#error").fadeIn().text("Tag the place");
			$("input#category").focus();
			return false;
		}
		
		
	});  
	
    return false;
});


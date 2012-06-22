$(document).ready(function(){
	// hide messages 
	$("#error").hide();
	//$("#success").hide();
	var form = $("#new_micropost");
	// on submit...
	form.submit(function() {
		$("#error").hide();
		
		var title = $("input#micropost_title").val();
		if(title == "" || title == null || title == "Give a title to your post"){
			$("#error").fadeIn().text("Title required");
			$("input#title").focus();
			return false;
		}
		
		var category = $("input#micropost_category").val();
		if(category == "" || category == null || category == "Tag your post"){
			$("#error").fadeIn().text("Tag the place");
			$("input#category").focus();
			return false;
		}
		
		
	});  
	
    return false;
});


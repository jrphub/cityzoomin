$(document).ready(function(){
	Placeholders.init();
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
		
		var tags = $("input#micropost_tags").val();
		if(tags == "" || tags == null || tags == "Tag your post"){
			$("#error").fadeIn().text("Tag the place");
			$("input#micropost_tags").focus();
			return false;
		}
		
		
	});  
	
    return false;
});


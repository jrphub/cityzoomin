$(document).ready(function(){
	// hide messages 
	$("#error").hide();
	//$("#success").hide();
	var form = $("#new_micropost");
	// on submit...
	form.submit(function() {
		$("#error").hide();
		var city = $("input#location_city").val();
		if(city == "" || city == null){
			$("#error").fadeIn().text("Please provide the city");
			$("input#location_city").focus();
			
			return false;
		}
		
		var state = $("input#location_state").val();
		if(state == "" || state == null){
			$("#error").fadeIn().text("Please provide the city");
			$("input#location_state").focus();
			
			return false;
		}
		
		var country = $("input#location_country").val();
		if(country == "" || country == null){
			$("#error").fadeIn().text("Please provide the city");
			$("input#location_country").focus();
			
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


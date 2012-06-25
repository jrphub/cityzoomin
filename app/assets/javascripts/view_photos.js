function showPhotos(postid){
	$("div#"+postid+" > a:first").addClass("fancybox-buttons");
	$("div#hidden_"+postid+" > a").addClass("fancybox-buttons");
	$('.fancybox-buttons').fancybox({
				closeBtn  : false,

				helpers : {
					title : {
						type : 'inside'
					},
					thumbs : {
							width: 75,
							height: 50
					},
					overlay : {
						speedIn : 500,
						opacity : 0.9
						
					},
					buttons	: {}
				},

				afterLoad : function() {
					this.title = 'Image ' + (this.index + 1) + ' of ' + this.group.length + (this.title ? ' - ' + this.title : '');
				},
				beforeClose : function() {
					$("div#"+postid+" > a:first").removeClass("fancybox-buttons");
					$("div#hidden_"+postid+" > a").removeClass("fancybox-buttons");
				}
			});
}
//JQuery tabs + resizing for google maps
$(function() {
		$( "#tabs" ).tabs({
				        fx: { opacity: 'toggle' },
				        select: function(event, ui) {
				                jQuery(this).css('height', jQuery(this).height());
				                jQuery(this).css('overflow', 'hidden');
				        },
				        show: function(event, ui) {
				                jQuery(this).css('height', 'auto');
				                jQuery(this).css('overflow', 'visible');
				        }
								
				});

});
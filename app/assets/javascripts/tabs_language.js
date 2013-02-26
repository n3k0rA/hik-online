//JQuery tabs + resizing for google maps


$(function() {
		$( "#tabs" ).tabs({
				        fx: { opacity: 'toggle', duration: 100 },
				        select: function(event, ui) {
				                jQuery(this).css('height', jQuery(this).height());
				                jQuery(this).css('overflow', 'hidden');
				        },
				        show: function(event, ui) {
				                jQuery(this).css('height', 'auto');
				                jQuery(this).css('overflow', 'visible');
												if (ui.panel.id == "tabs-4_map") {
										        google.maps.event.trigger(map, 'resize');
														var lat = Gmaps.map.markers[0].lat;
														var lng = Gmaps.map.markers[0].lng;
														var centerpoint = new google.maps.LatLng(lat, lng);
														Gmaps.map.map.setCenter(centerpoint);

										    }
				        }
								
				});

});
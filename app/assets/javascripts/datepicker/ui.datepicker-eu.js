/* Euskarako oinarria 'UI date picker' jquery-ko extentsioarentzat */ 
/* Karrikas-ek itzulia (karr...@karrikas.com) */ 
jQuery(function($){ 
        $.datepicker.regional['eu'] = { 
                closeText: 'Egina', 
                prevText: '&#x3c;Aur', 
                nextText: 'Hur&#x3e;', 
                currentText: 'Gaur', 
                monthNames:   
['Urtarrila','Otsaila','Martxoa','Apirila','Maiatza','Ekaina', 
                'Uztaila','Abuztua','Iraila','Urria','Azaroa','Abendua'], 
                monthNamesShort: ['Urt','Ots','Mar','Api','Mai','Eka', 
                'Uzt','Abu','Ira','Urr','Aza','Abe'], 
                dayNames:   
['Igandea','Astelehena','Asteartea','Asteazkena','Osteguna','Ostirala','Larunbata'], 
                dayNamesShort: ['Iga','Ast','Ast','Ast','Ost','Ost','Lar'], 
                dayNamesMin: ['Ig','As','As','As','Os','Os','La'], 
                dateFormat: 'yy/mm/dd', 
                firstDay: 1, 
                isRTL: false, 
                showMonthAfterYear: false, 
                yearSuffix: ''}; 
        $.datepicker.setDefaults($.datepicker.regional['eu']); 
});

 /* Basque trannslation for JQuery Timepicker Addon */ 
/* Translated by Xabi Fer*/ 
(function($) {
	$.timepicker.regional['eu'] = {
		timeOnlyTitle: 'Aukeratu ordua',
		timeText: 'Ordua',
		hourText: 'Orduak',
		minuteText: 'Minutuak',
		secondText: 'Segunduak',
		millisecText: 'Milisegunduak',
		timezoneText: 'Ordu-eremua',
		currentText: 'Orain',
		closeText: 'Itxi',
		timeFormat: 'HH:mm',
		amNames: ['a.m.', 'AM', 'A'],
		pmNames: ['p.m.', 'PM', 'P'],
		isRTL: false
	};
	$.timepicker.setDefaults($.timepicker.regional['eu']);
})(jQuery);
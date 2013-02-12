alert(I18n.currentLocale());
<% if I18n.locale.to_s == 'es' %>
	alert("lole");
<% elsif I18n.locale.to_s == 'en' %>
	alert("loles en");
<% elsif I18n.locale.to_s == 'eu' %>
	alert("lol eu");
<% elsif I18n.locale.to_s == 'fr' %>
	alert("lol fr");
<% end %>


I18n.defaultLocale = "pt-BR";
I18n.locale = "pt-BR";
var fo = '2';
alert(fo);

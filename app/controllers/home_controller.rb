class HomeController < ApplicationController
  def index
    if I18n.locale.to_s == "eu"
      @entries = Entry.where('eu = ?', true).last(2)
    elsif I18n.locale.to_s == "en"
      @entries = Entry.where('en = ?', true).last(2)
    elsif I18n.locale.to_s == "fr"
      @entries = Entry.where('fr = ?', true).last(2)
    else
      @entries = Entry.where('es = ?', true).last(2)
    end
    
    @events = Event.where('pic_file_name IS NOT NULL').random(8)
  end
  
end

class Event < ActiveRecord::Base  
  attr_accessible :address, :approved, :cancel_message, :cancelled, :created_at, :des_en, :des_es, :des_eu, :des_fr, :description, :email, :finish_date, :id, :phone, :place, :price, :province, :reminded, :start_date, :tickets, :title, :title_en, :title_es, :title_eu, :title_fr, :town, :updated_at, :user_id, :views, :website
end

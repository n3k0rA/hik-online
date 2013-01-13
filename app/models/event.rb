class Event < ActiveRecord::Base  
  attr_accessible :address, :approved, :cancel_message, :cancelled, 
  :created_at, :des_en, :des_es, :des_eu, :des_fr, :description, :email, 
  :finish_date, :id, :phone, :place, :price, :province, :reminded, :start_date, 
  :tickets, :title, :title_en, :title_es, :title_eu, :title_fr, :town, :updated_at, 
  :user_id, :views, :website, :pic
  
  #Paperclip
  validates_attachment_size :pic, :less_than => 5.megabytes    
  validates_attachment_content_type :pic, :content_type => ['image/jpeg', 'image/png']
  has_attached_file :pic, :styles =>
            { :original => "1024x1024>", :big =>"535x535>", :medium => "300x300>", :thumb => "100x100>"},
            :storage => Rails.env.production? ? :s3 : :filesystem,
            :s3_credentials => {
              :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
              :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
            },
            :path => ":attachment/:id/:style.:extension",
            :bucket => ENV['S3_BUCKET_NAME'],
            :default_url => "/images/default_:style_pic.png"
          
end

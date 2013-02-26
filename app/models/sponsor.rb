class Sponsor < ActiveRecord::Base
  attr_accessible :title_es, :title_eu, :title_fr, :title_en, :body_es, :body_eu, :body_fr, :body_en, :es, :eu, :fr, :en

  #Paperclip
  validates_attachment_size :image, :less_than => 5.megabytes    
  validates_attachment_content_type :image, :content_type => /^image\/(png|gif|jpeg)/
  has_attached_file :image, :styles =>
            { :big =>"535x535>", :medium => "300x300>", :thumb => "100x100>"},
            :storage => Rails.env.production? ? :s3 : :filesystem,
            :s3_credentials => {
              :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
              :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
            },
            :path => ":attachment/:id/:style.:extension",
            :bucket => ENV['S3_BUCKET_NAME']


end

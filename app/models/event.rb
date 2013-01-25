class Event < ActiveRecord::Base  
  extend FriendlyId
  friendly_id :title_with_id, use: [:slugged, :history]
  
  attr_accessible :address, :cancel_message, :des_en, :des_es, :des_eu, :des_fr, 
  :email, :finish_date, :phone, :place, :price, :province, :start_date, 
  :tickets, :title, :title_en, :title_es, :title_eu, :title_fr, :town,
  :website, :pic, :user_id, :category_ids
  
  belongs_to :user
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :users
  has_many :comments, :dependent => :destroy
  has_many :translations, :dependent => :destroy
  
  #validates_datetime :finish_date, :after => :start_date
  #validates_datetime :finish_date, :on_or_after => lambda { Date.current }
  validates :town, presence: true
  validate :the_event_must_have_at_least_one_description
  validates :price, numericality: {greater_than_or_equal_to: 0}
  #scope :start_between, lambda{|from, to| where ["start_date BETWEEN ? and ?", from.to_date - 1, to.to_date + 1] }
  
  
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
            
            
  #Sets the values for the Province select field
  PROVINCES = ["alaba", "biscay", "guipuzkoa", "navarre", "labourd", "b_navarre", "soule"]
           
            
  #validates the presence of at least one title and description
  def the_event_must_have_at_least_one_description
    if des_es.empty? && des_eu.empty? && des_en.empty? && des_fr.empty?
      errors.add(:des_es, "Please fill in the desciption at least in one language")
    end
    if title_es.empty? && title_eu.empty? && title_en.empty? && title_fr.empty?
      errors.add(:des_es, "Please fill in the title at least in one language")
    end
  end
  
  protected
    #defines the url for the event instaed the ID
    def title_with_id
      if I18n.locale.to_s == "es" && !title_es.empty? 
        title_es
      elsif I18n.locale.to_s == "eu" && !title_eu.empty? 
        title_eu
      elsif I18n.locale.to_s == "fr" && !title_fr.empty? 
        title_fr
      else
        title_en
      end
    end
  
end

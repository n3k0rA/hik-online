class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
  
  # Mailboxer
  acts_as_messageable
  
  #Follow Model
  acts_as_follower
  acts_as_followable
  
  # Devise
  devise :database_authenticatable, :registerable, :lockable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable

  attr_accessor :current_password
  validates_presence_of :name
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :current_password, :email, :password, :password_confirmation, :remember_me, :provider, 
    :uid, :name, :gender, :town, :avatar, :translated, :created
  
  has_many :created_events, :class_name => "Event", :foreign_key => "user_id"
  has_many :micropsots, :dependent => :destroy
  has_and_belongs_to_many :events
  has_many :comments, :dependent => :destroy
  has_many :translations
  
  
  
  #Paperclip
  validates_attachment_size :avatar, :less_than => 5.megabytes    
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']
  has_attached_file :avatar,
    :styles => { :original => "1024x1024>", :medium => "300x300>", :thumb => "100x100>" },
    :storage => Rails.env.production? ? :s3 : :filesystem,
    :s3_credentials => {
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    },
    :path => ":attachment/:id/:style.:extension",
    :bucket => ENV['S3_BUCKET_NAME'],
    :default_url => "/images/default_:style_photo.png"
    
  
  #Sets the values for the Province select field 
  PROVINCES = ["alaba", "biscay", "guipuzkoa", "navarre", "labourd", "b_navarre", "soule"]
    
    
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first || User.where(:email => auth.info.email).first
    
    unless user
      user = User.create(name:auth.extra.raw_info.name,
                           provider:auth.provider,
                           uid:auth.uid,
                           email:auth.info.email,
                           gender:auth.extra.raw_info.gender,
                           town:auth.extra.raw_info.location,
                           password:Devise.friendly_token[0,20]
                           )
      user.skip_confirmation!
    end
    user
  end
  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
  
  
  #Used by mailbox gem
  def display_name
    return name
  end
  
  #Returning the email address of the model if an email should be sent for this object (Message or Notification).
  #If no mail has to be sent, return nil.
  def mailboxer_email(object)
    #Check if an email should be sent for that object
    #if true
    return email
    #if false
    #return nil
  end
  
  
  
end

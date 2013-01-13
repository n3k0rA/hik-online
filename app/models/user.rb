class User < ActiveRecord::Base
  # Devise
  devise :database_authenticatable, :registerable, :lockable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable

  attr_accessor :current_password
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :current_password, :email, :password, :password_confirmation, :remember_me, :provider, 
    :uid, :name, :gender, :town, :avatar
  
  #Paperclip
  #validates_attachment_size :avatar, :less_than => 5.megabytes    
  has_attached_file :avatar,
  :styles => { :original => "1024x1024>", :medium => "300x300>", :thumb => "100x100>" },
  
  
  
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
  
  
end

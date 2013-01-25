class Translation<ActiveRecord::Base
  
  belongs_to :user
  belongs_to :event

  attr_accessible :event_id, :title_es, :des_es, :title_eu, :des_eu, :title_fr, 
                :des_fr, :title_en, :des_en, :comment, :user_id
  
  
end
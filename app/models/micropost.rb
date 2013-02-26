class Micropost < ActiveRecord::Base
  attr_accessible :content, :event_id, :target_id, :user_id
  
  belongs_to :user
  belongs_to :comment
  belongs_to :follow
  belongs_to :event
  
  # Content ID
  # 1 = U place a comment in E
  # 2 = U is following U
  # 3 = U is attending E
  # 4 = U updated the info in E
  # 5 = U added translation to E
  # 6 = U uploaded a new event
  # 7 = U cancelled E
  #
  #
  
  
  
  
end

class Alarm < ActiveRecord::Base
  attr_accessible :user_id, :title, :keyword, :where, :active, :category_ids
  
  belongs_to :user
  has_and_belongs_to_many :categories
  
   
end

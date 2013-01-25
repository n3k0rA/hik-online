class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  has_many :microposts, :dependent => :destroy
  
  validates_presence_of :body
  attr_accessible :event_id, :user_id, :body, :boolean, :event
end
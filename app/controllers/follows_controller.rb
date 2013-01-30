class FollowsController < ApplicationController
  
  after_filter :create_micropost, :only => [:create]
  after_filter :delete_follow_micropost, :only => [:destroy]
  
  
  def create
    @content = "2"
    @user = User.find(params[:user_id])
    current_user.follow(@user)
  end
  
  def destroy
    @user = User.find(params[:user_id])
    current_user.stop_following(@user)
  end
end
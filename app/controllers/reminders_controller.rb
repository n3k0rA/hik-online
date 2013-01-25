class RemindersController < ApplicationController
  
  after_filter :create_micropost, :only => [:create]
  
  
  def create
    @event = Event.find(params[:id])
    if current_user
      @content ="3"
      @event.users << current_user
      redirect_to @event, :notice => "You are now following"
    else
      redirect_to new_user_registration_url, :notice => "You have to be a memeber to store this reminder"
    end
  end
  
  def destroy
    @event = Event.find(params[:id])
    @user = current_user
    @event.users.delete(@user)
    redirect_to @event, :notice => "So sorry to hear that"
  end
  
end
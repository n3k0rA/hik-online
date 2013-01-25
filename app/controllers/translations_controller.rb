class TranslationsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def new
    @event = Event.find(params[:id])
    @translation = Translation.new(params[:event_id => @event.id])
  end
  
  def create
    @translation = Translation.new(params[:translation].merge(:user_id=>current_user.id))
    respond_to do |format|
      if @translation.save
        #Send EMAIL to confirm translation
        format.html { redirect_to @translation.event, notice: I18n.t(:greeting_user)}
        format.json { render json: @translation.event, status: :created, location: @translation.event }
      else
        format.html {render action: "new"}
        format.json { render json: @translation.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
    @translation = Translation.find(params[:id])
    respond_to do |format|
      format.html 
      format.json { render json: @translation}
    end
  end
  
  
  def commit
    
  end
  
  
end
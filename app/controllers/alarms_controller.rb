class AlarmsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def create
    categories = params[:category_ids] or []
    @alarm = Alarm.new(params[:alarm].merge(:category_ids => categories))  
    @alarm.user = current_user 
    respond_to do |format|
      if @alarm.save
        format.html { redirect_to user_alarms_path, notice: "Alarms saved succesfully" }
        format.json { render json: user_alarms_path, status: :created, location: user_alarms_path}
      else
        format.html { redirect_to user_alarms_path, notice: "Impossible to save. Check the form" }
        format.json { render json: @alarm.errors, status: :inprocessable_entity }
      end
    end
  end
  
  # Edits an existing alarm
  def edit
    @alarm = Alarm.find(params[:id])
  end
  
  # Updates an alarm's parameters after being edited
  def update
    categories = params[:category_ids] or []
    @alarm = Alarm.find(params[:id])
    respond_to do |format|
      if @alarm.update_attributes(params[:alarm].merge(:category_ids => categories))
        format.html { redirect_to user_alarms_path, notice: I18n.t(:alarm_saved) }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @alarm.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # Destroy an alarm
  def destroy
    @alarm = Alarm.find(params[:id])
    @alarm.destroy
    respond_to do |format|
      format.html { redirect_to user_alarms_path }
      format.json { head :ok }
    end
  end
  
  # Display a list of current user's alarms
  def index
    @alarms = current_user.alarms.all
    @alarm = Alarm.new()
  end
  
  # Activates or desactivates an alarm
  def switch
    @alarm = Alarm.find(params[:id])
    if @alarm.active
      @alarm.active = false
    else
      @alarm.active = true
    end
    @alarm.save
    redirect_to user_alarms_path
  end
end

class EventsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  
  after_filter :create_micropost, :only => [:update]
  
  # GET /events
  # GET /events.json
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    @event.views = @event.views + 1
    @event.save
    @comment = Comment.new(:event => @event)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new
    @event.price = 0
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    categories = params[:category_ids] or []
    @event = Event.new(params[:event].merge(:user_id => current_user.id, :category_ids => categories))
    check_date

    respond_to do |format|
      if @event.save
        #Mailer to seek appoval
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])
    
    respond_to do |format|
      if @event.update_attributes(params[:event])
        @content = "4"
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    if (@event.users.empty? || !@event.approved)
      @event.categories.delete
      @event.destroy
      respond_to do |format|
        format.html { redirect_to events_url }
        format.json { head :no_content }
      end
    else
      @event.cancelled = true
      @event.approved = false
      @event.save
      redirect_to cancel_event_path(:id=>@event.id)
    end
  end
  
  def cancel
    @event = Event.find(params[:id])
  end
  
  
private 

  # Set the event to 'reminded'
  def check_date
    if close_date
      @event.reminded = true
    end
  end
  
  # Checks whether an event is happening in less than 72h
  def close_date
    if ((@event.start_date-Time.now)< 259146.01469397545)
      true
    else 
      false
    end
  end
end

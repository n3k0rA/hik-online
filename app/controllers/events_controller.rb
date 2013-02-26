class EventsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  
  after_filter :create_micropost, :only => [:update, :cancel]
  
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
    @event.views += 1
    @event.save
    @comment = Comment.new(:event => @event)
    @json = @event.to_gmaps4rails do |event, marker|
      marker.picture({
              :picture => "http://hik-fyp.heroku.com/assets/goazen_hikultura%20com_euskal_herriko_kultura-7049c7c97025437194e3f748ea8d5782.png",
              :width => 32,
              :height => 32
            })
      marker.json({ :description => @event.address })
    end
    
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
  
  # Creates a new event with same parameters of an existing one
  def resubmit
    @old_event = Event.find(params[:id])
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    
    params[:event][:start_date] = params[:event][:start_date].present? ? DateTime.parse(params[:event][:start_date]) : nil
    params[:event][:finish_date] = params[:event][:finish_date].present? ? DateTime.parse(params[:event][:finish_date]) : nil

    categories = params[:category_ids] or []
    @event = Event.new(params[:event].merge(:user_id => current_user.id, :category_ids => categories))
    
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
      @event.categories.clear
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
    @content = "7"
    @event = Event.find(params[:id])
  end
  
  
private 

  # Set the event to 'reminded'
  def check_date(event)
    if close_date(event)
      event.reminded = true
    end
  end
  
  # Checks whether an event is happening in less than 72h
  def close_date(event)
    ((event.start_date-Time.now)< 259146.01469397545)
  end
end

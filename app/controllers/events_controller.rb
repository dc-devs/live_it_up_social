class EventsController < ApplicationController

  def index
    @photo = Photo.new
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def pictures
    #this is hardcoded in to allow testing of the view before s3 photo uploading is hooked up for event photos. it will after the fact pull photo urls from the photo table and pass them to the view
    @activities = Activity.all
    @event = Event.first
    @photo = Photo.first
    @photos = Photo.all.includes(:user)
    render :pictures
  end

  def show
    @photo = Photo.new
    @event = Event.find(params[:id])
    @users = User.all
    @trips = Trip.where(event_id: @event.id)
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
    @event.users << current_user
    if @event.save
      redirect_to @event
    else
      render :new
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:notice] = 'Event Updated!'
      redirect_to @event
    else
      render :edit
    end
  end

  private
    def event_params
      params.require(:event).permit(:date, :start_time, :duration, :activity_id)
    end
end

class EventsController < ApplicationController
  
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
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

class EventsController < ApplicationController
  
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(user_params)
    if @event.save
      redirect_to users_url, notice: 'New user created.'
    else
      render :new
    end
  end

  private
    def user_params
      params.require(:event).permit(:date, :start_time, :duration, :activity_id)
    end
end

class TripsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @trip  = Trip.new(user_id: current_user.id, event_id: params[:event_id])
      if @trip.save
        redirect_to @event
      else
        redirect_to @event 
      end
  end
  
end

require 'date'

class ActivitiesController < ApplicationController

  def index
    if week_day # need to add < 5 IOT function, removed for development purposes
      @activities = Activity.all
      @vote = Vote.new
    elsif week_day == 6
      render 'gone_fishing'
    else
      render 'rsvp'
    end
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    # activity.update(user_id: session[:current_user_id])
    @activity.save
    render :show
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])

    if @activity.update(activity_params)
      redirect_to @activity
    else
      render edit_activity_path
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to root_path
  end

  def week_day
    day = Date.today.wday
  end

  def activity_params
    params.require(:activity).permit(:title, :description, :location, 
      :category, :icon, :photo, :necessities, :user_id)
  end

end
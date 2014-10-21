require 'date'
class ActivitiesController < ApplicationController

  def index
    if week_day # need to add < 5 IOT function, removed for development purposes
      @activities = Activity.all
      @activity = Activity.new
      @sorted_by_vote = Activity.sort_acrtivities(@activities)
      today = (Time.now.midnight..Time.now)
      @trending_activities = Activity.where(created_at: today)
      @recent_activities = Activity.where(created_at: today)
      @trending_activities = Activity.sort_acrtivities(@trending_activities)
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
    @activity   = Activity.new(activity_params)
    @activity.save
    @activities = Activity.all
    @sorted_by_vote = Activity.sort_acrtivities(@activities)
    today = (Time.now.midnight..Time.now)
    @trending_activities = Activity.where(created_at: today)
    @recent_activities = Activity.where(created_at: today)
    @trending_activities = Activity.sort_acrtivities(@trending_activities)
    @vote       = Vote.new
    render :index
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

  def search
    @activities = Activity.where(category: params[:query].downcase)
    if @activities.count > 1
      @sorted_by_vote = Activity.sort_acrtivities(@activities)
    else
      @sorted_by_vote = @activities
    end
    today = (Time.now.midnight..Time.now)
    @trending_activities = @activities.where(created_at: today)
    @trending_activities = Activity.sort_acrtivities(@trending_activities)

    @recent_activities = @activities.where(created_at: today)
    @activity = Activity.new
    @vote = Vote.new
    render :index
  end

end

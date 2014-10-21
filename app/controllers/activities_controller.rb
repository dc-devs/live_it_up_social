require 'date'
class ActivitiesController < ApplicationController
  before_filter :corresponding_day_page, :only => :index
  before_filter :sort_by_vote_count, :only => [:index, :create, :search]

  def index
    @activities = Activity.all
    @activity   = Activity.new
    @vote       = Vote.new

    render :index
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity   = Activity.new(activity_params)
    @activities = Activity.all
    @vote       = Vote.new
    
      if @activity.save
        redirect_to activities_path
      else
        render :index
      end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    
    if @activity.update(activity_params)
      redirect_to activities_path
    else
      render :edit
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to activities_path
  end

  def search
    @activities = Activity.where(category: params[:query].downcase)
    @activity   = Activity.new
    @vote       = Vote.new
    
    render :index
  end

  private

    def saturday?
      Date.today.wday == 6
    end
    
    def friday?
      Date.today.wday == 5
    end
    
    def activity_params
      params.require(:activity).permit(:title, :description, :location,
        :category, :icon, :photo, :necessities, :user_id)
    end

    def corresponding_day_page
      @event = Event.last
      redirect_to @event if friday?
      redirect_to @event if saturday?
    end
    
    def sort_by_vote_count
      activities = Activity.all
      @sorted_by_vote = Activity.sort_acrtivities(activities)
    end

end

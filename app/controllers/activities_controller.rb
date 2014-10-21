require 'date'
class ActivitiesController < ApplicationController
  before_filter :corresponding_day_page, :only => :index
  before_filter :sort_by_vote_count, :only => [:index, :create, :search]

  def index
    @activities = Activity.all
    @activity   = Activity.new
    @vote       = Vote.new

    @sorted_by_vote = Activity.sort_acrtivities(@activities)
      today = (Time.now.midnight..Time.now)
    @recent_activities = Activity.where(created_at: today)
    @trending_activities = Activity.where(created_at: today)
    @trending_activities = Activity.sort_acrtivities(@trending_activities)

    render :index
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def new
    @activity = Activity.new
  end

  def create
    @vote       = Vote.new
    @activities = Activity.all
    @activity   = Activity.new(activity_params)
    @activity.save

    @sorted_by_vote = Activity.sort_acrtivities(@activities)
    today = (Time.now.midnight..Time.now)
    @trending_activities = Activity.where(created_at: today)
    @recent_activities = Activity.where(created_at: today)
    @trending_activities = Activity.sort_acrtivities(@trending_activities)

    render :index
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
     today = (Time.now.midnight..Time.now)
     if @activities.count > 1
       @sorted_by_vote = Activity.sort_acrtivities(@activities)
       @trending_activities = @activities.where(created_at: today)
       @trending_activities = Activity.sort_acrtivities(@trending_activities)
     else
       @sorted_by_vote = @activities
       @trending_activities = @activities
     end

     @recent_activities = @activities.where(created_at: today)
     @activity = Activity.new
     @vote = Vote.new
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

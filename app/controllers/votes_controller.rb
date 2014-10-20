class VotesController < ApplicationController

  def index
    @vote = Vote.first
  end

  def show
  end
#for POST route
  def create
    @vote = Vote.new(vote_params)
    @vote.save
    @activities = Activity.all

    activity = Activity.find(@vote.activity_id)
    @votes = activity.votes.count
    render json: @votes

  end
#for GET route
  def new
    @vote = Vote.new
  end

  def update
  end

  def destroy
  end

  private

  def vote_params
    params.require(:vote).permit(:user_id, :activity_id)
  end

end

class VotesController < ApplicationController

  def index
    @vote = Vote.first
  end

  def show
  end

  def create
    @vote = Vote.new(vote_params)
    @vote.save
    @activities = Activity.all
    
    current_user.remaining_votes -= 1
    current_user.save!

    activity = Activity.find(@vote.activity_id)
    @votes = activity.votes.count
    render json: @votes
  end

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

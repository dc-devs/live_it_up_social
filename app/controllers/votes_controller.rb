class VotesController < ApplicationController

  def index
    @vote = Vote.first
  end

  def create
    @vote = Vote.new(vote_params)
    @vote.save
    @activities = Activity.all

    if current_user.remaining_votes > 0
      current_user.remaining_votes -= 1
      current_user.save!

      activity = Activity.find(@vote.activity_id)
      @votes = activity.votes.count
      render json: @votes
    end
  end

  def new
    @vote = Vote.new
  end

  private
  def vote_params
    params.require(:vote).permit(:user_id, :activity_id)
  end
end

class VotesController < ApplicationController

  def index
    @vote = Vote.first
  end

  def show
  end

  def create
    # new + save == .create
    #
    # since you're not sending @vote to a view anymore, no need for @vote
    # versus `vote`
    @vote = Vote.new(vote_params)
    @vote.save


    # Add som TOTALLY SWEET methods on Vote that are lik
    # Vote.has_more_votes_for_this_week?(@user)
    # Vote.can_vote_more?(@user)
    # Vote.prevented_bc_user_is_a_douche?(@user)

    # remove unused code
    # @activities = Activity.all

    # I don't like this.
    # I think this is a weird implementation of "use can only vote once per
    # Activity"
    #current_user.remaining_votes -= 1
    #current_user.save!

    # why not use @vote.activity
    activity = Activity.find(@vote.activity_id)
    @votes = @vote.activity.votes.count
    render json: @votes


    # It's a good method, but you could prbably get this to 4 lines.
    #
    # use active record associations.
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

class VotesController < ApplicationController

  def index
    @vote = Vote.first
  end

  def show
  end
#for POST route
  def create
    vote = Vote.create(user_id: params["vote"][:user], activity_id: params["vote"][:activity])

    redirect_to votes_path
  end
#for GET route
  def new
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

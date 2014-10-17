class VotesController < ApplicationController

  def index
    @vote = Vote.first
  end

  def show
  end
#for POST route
  def create
    p params

    Vote.create(vote_params)
    redirect_to root_path
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
    params.require("vote").permit(:user_id, :activity_id)
  end

end

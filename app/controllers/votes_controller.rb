class VotesController < ApplicationController

  def index
    @vote = Vote.first
  end

  def show
  end
#for POST route
  def create
    @vote = Vote.new(vote_params)
    if @vote.save
      redirect_to activities_path
    else
      redirect_to activities_path
    end

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

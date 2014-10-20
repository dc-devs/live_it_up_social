class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user_email = params[:session][:email]
    @user = User.find_by(:email => @user_email)
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to activities_path, :notice => "Logged in!"
    else
      flash[:notice] = "Invalid email or password"
      render "_new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end

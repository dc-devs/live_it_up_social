class AuthenticationsController < ApplicationController
    layout :nil

    def create
      # Omniauth Hash
      omniauth = request.env["omniauth.auth"]
      # Does Authentication already Exist? 
      authentication = Authentication.find_by_provider_and_uid(omniauth[:provider], omniauth[:uid])
      # Does user with FB email exist? 
      user = User.find_by_email(omniauth[:info][:email])

       
      if authentication
        #if Authentication exists 
        if @user = authentication.user
          session[:user_id] = @user.id
          @user.update_attributes(:remote_photo_url => omniauth[:info][:image].gsub('http://','https://'))
          load_in_activity_variables
          redirect_to activities_path
        end
      elsif current_user                  
        #if Authentication does not exist && signed in
        if current_user.authentications.create!(:provider => omniauth[:provider], :uid => omniauth[:uid])
          session[:user_id] = current_user.id
          current_user.update_attributes(:remote_photo_url => omniauth[:info][:image].gsub('http://','https://'))
          load_in_activity_variables
          redirect_to activities_path
        end
      else
        #Authentication does not exist && not already logged in
        @user = User.new(:email => omniauth[:info][:email], 
                   :first_name => omniauth[:info][:first_name],
                   :last_name => omniauth[:info][:last_name],
                   :username => omniauth[:info][:nickname],
                   :password => SecureRandom.hex(8),
                   :remote_photo_url => omniauth[:info][:image].gsub('http://','https://'),
                   :professional_blurb => "Professional Rebase Consultant"
                  )

        @user.authentications << Authentication.new(:provider => omniauth[:provider], :uid => omniauth[:uid])
        
        if @user.save!
          session[:user_id] = @user.id
          load_in_activity_variables
          redirect_to activities_path
        else
          redirect_to root
        end
      end #Initial If Then

    end #CREATE

    def load_in_activity_variables
      @activities = Activity.all
      @activity   = Activity.new
      @vote       = Vote.new
      # @search_activities = true

      @sorted_by_vote = Activity.sort_acrtivities(@activities)
        today = (Time.now.midnight..Time.now)
      @recent_activities = Activity.where(created_at: today)
      @trending_activities = Activity.where(created_at: today)
      @trending_activities = Activity.sort_acrtivities(@trending_activities)
    end
end

class UserMailer < ActionMailer::Base
  default from: 'liveitupsocial@gmail.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to Live It Up Social")
  end
end
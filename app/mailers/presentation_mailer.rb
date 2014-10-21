class PresentationMailer < ActionMailer::Base
  default from: 'melroman26@gmail.com'

  def event_recap(user)
    @user = user
    mail to: @user.email, subject: "Saturday's Recap"
  end
end
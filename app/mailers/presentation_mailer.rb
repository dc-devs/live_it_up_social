class PresentationMailer < ActionMailer::Base
  default to: Proc.new { User.pluck(:email) },
          from: 'melroman26@gmail.com'

  def event_recap(user)
    @user = user
    mail(subject: "Weekend Recap")

  end
end


class PresentationMailer < ActionMailer::Base
  default to: Proc.new { User.pluck(:email) },
          from: 'liveitupsocial@gmail.com'

  def event_recap
    mail(subject: "Weekend Recap")
  end
end


require 'rubygems'
require 'twilio-ruby'

class Texter

  def self.sendText
    account_sid = 'ACc4a93a1b7615ff406f3990a5d9e10402'
    auth_token = 'f0af63321c1f2669fa7cddb6d80ab992'
    @client = Twilio::REST::Client.new account_sid, auth_token

    Twilio.configure do |config|
      config.account_sid = account_sid
      config.auth_token = auth_token
    end

    @users = User.all
    @users.each do |user|
    @event = Event.last
    @activity = Activity.find(@event.activity_id)

        @client.messages.create(
        from: '+14154232467',
        to: user.phone_number,
        body: 'Hey there ' + user.first_name + '! The winning Live It Up Social event this week is ' + @activity.title + '. Everybody will be meeting at ' + @activity.location + ' @ ' + @event.start_time + ' on ' + @event.date + '. RSVP!')
    end
  end

  def self.setEvent
    winning_activity_id = Vote.group(:activity_id).count(:activity_id).sort_by{|activity, count| count}.reverse[0][0]
    Activity.find(winning_activity_id).events.create()
    # need to set votes to zero somehow Activity.find(winning_activity_id).destroy
  end

end
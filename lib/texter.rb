require 'rubygems'
require 'twilio-ruby'

# I do very much like that you created a class to wrap the operations of your
# Twilio interface.  This is very classy : pinky up!
#
# WAG OF THE FINGER:  If you are going to create such a LOVELY wrapper around
# Twilio...where the model test?

# I would also implement this one like this
# 
# 
# t = Texter.new(ENV['SID'], ENV['token'])
# t.sendText!


class Texter
  def self.razzle
    "you have been razzled UPDATED"
  end

  def self.sendText
    #NO NO NO NO NONO NONONONONONONONONONONONONONONONONON!
    # You do not commit your credentials inside your code.  Or else some crazy
    # Russian hax0r will steal your Twilios and text your mom

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

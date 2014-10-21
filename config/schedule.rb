# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# every :friday, :at => '10am' do
#   runner "Texter.sendText"
# end

# every :friday, :at => ''

every :friday, :at => '12am' do
  runner "Texter.setEvent", environment: "development"
end

every :friday, :at => '10am' do
  runner "Texter.sendText", environment: "development"
end

every :monday, :at => '10am' do
  runner "PresentationMailer.event_recap.deliver", environment: "development"
end

# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

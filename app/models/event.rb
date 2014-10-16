class Event < ActiveRecord::Base
  belongs_to :activity
  has_many   :user_events
  has_many   :users, through: :user_events
end
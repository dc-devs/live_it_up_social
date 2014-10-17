class Event < ActiveRecord::Base
  belongs_to :activity
  has_many   :trips
  has_many   :users, through: :trips
end
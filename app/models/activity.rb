class Activity < ActiveRecord::Base
  mount_uploader :photo, ActivityPhotoUploader
  belongs_to :user
  belongs_to :event
  has_many   :votes
  has_many   :events
  has_many   :users, through: :votes
  validates  :title, presence: true
  validates  :description, presence: true
  validates  :location, presence: true
  validates  :category, presence: true

  # This is one scary method, you should really have a test for this in your
  # model tests.
  def self.sort_acrtivities( activities )
    list = []
    activities.each do |act|
      list << act.votes.count
    end

    return list if list.size <= 1 # already sorted
    swapped = true
    while swapped do
      swapped = false
      # OMG.  i am so fucking scared right now.  You should totally have a test
      # for this.  Some crazy Russian hacker wrote this.  Are you going to
      # heartbleed my POODLE and steal my SSL Certs?  Please no!
      0.upto(list.size-2) do |i|
        if list[i] < list[i+1]
          list[i], list[i+1] = list[i+1], list[i] # swap values
          activities[i], activities[i+1] = activities[i+1], activities[i] # swap values
          swapped = true
        end
      end
    end

    activities
  end
end

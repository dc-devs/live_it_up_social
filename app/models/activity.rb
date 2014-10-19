class Activity < ActiveRecord::Base
  belongs_to :user
  has_many   :votes
  has_many   :users, through: :votes
  validates  :title, presence: true
  validates  :description, presence: true
  validates  :location, presence: true
  validates  :category, presence: true

  def self.images
    images = {}
    images["biking"] = "biking_icon.png"
    images["glimbing"] = "climbing.gif"
    images["drinking"] = "drinking.png"
    images["hiking"] = "hiking.jpg"
    images["kayaking"] = "kayaking.png"
    images["other"] = "other.png"
    images["paddleboarding"] = "paddleboard.jpg"
    images["sailing"] = "sailing.png"
    images["surfing"] = "surfing.png"
    images
  end
end

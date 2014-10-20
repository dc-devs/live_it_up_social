class Activity < ActiveRecord::Base
  mount_uploader :photo, ActivityPhotoUploader
  belongs_to :user
  belongs_to :event
  has_many   :votes
  has_many   :users, through: :votes
  validates  :title, presence: true
  validates  :description, presence: true
  validates  :location, presence: true
  validates  :category, presence: true
end

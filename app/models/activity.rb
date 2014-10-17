class Activity < ActiveRecord::Base
  belongs_to :user
  has_many   :votes
  has_many   :users, through: :votes
  validates  :title, presence: true
  validates  :description, presence: true
  validates  :location, presence: true
  validates  :category, presence: true
end
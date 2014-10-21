class User < ActiveRecord::Base
  mount_uploader :photo, UserPhotoUploader
  has_secure_password
  validates_presence_of :password, :on => :create
  has_many :votes
  has_many :activities, through: :votes
  has_many :authentications
end

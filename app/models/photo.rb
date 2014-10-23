class Photo < ActiveRecord::Base
  mount_uploader :photo_url, EventPhotoUploader
  belongs_to :event
  belongs_to :user

end
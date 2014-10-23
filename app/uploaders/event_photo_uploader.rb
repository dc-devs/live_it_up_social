class EventPhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  storage :fog

  def store_dir
    if Rails.env.test?
      "uploads/test/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    elsif Rails.env.production?
      "uploads/production/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    else
      "uploads/development/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end
  end

  def default_url
     ActionController::Base.helpers.asset_path("fallback/rock-climbing.png")
  end

  version :event_photo_500 do
    process :resize_to_fill => [500, 500]
  end

  version :event_photo_300 do
    process :resize_to_fill => [300, 300]
  end


  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
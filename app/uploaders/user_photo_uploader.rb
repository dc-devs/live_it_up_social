class UserPhotoUploader < CarrierWave::Uploader::Base
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
     ActionController::Base.helpers.asset_path("fallback/" + [version_name, "abe-lincoln.jpg"].compact.join('_'))
  end

  version :logged_in_thumb do
    process :resize_to_fill => [30, 30]
  end

  version :profile_settings_thumb do
    process :resize_to_fill => [75, 75]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end


end

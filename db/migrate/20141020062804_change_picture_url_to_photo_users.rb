class ChangePictureUrlToPhotoUsers < ActiveRecord::Migration
  def change
    rename_column :users, :picture_url, :photo
  end
end

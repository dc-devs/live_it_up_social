class PhotosController < ApplicationController

  def create
    @photo = Photo.new(photo_params)
    @event = Event.find(params[:photo][:event_id])
    if @photo.save
      redirect_to @event
    else
      redirect_to @event
    end
  end

  private

    def photo_params
      params.require(:photo).permit(:event_id, :user_id, :photo_url)
    end

end
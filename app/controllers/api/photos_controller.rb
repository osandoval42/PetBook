class Api::PhotosController < ApplicationController
  def create
    to_create = photo_params
    to_create[:album_id] = params[:album_id]
    to_create[:date] = Date.today

    @album = Album.find(to_create[:album_id])
    set_cover_and_profile_photo_attrs(to_create)

    @photo = Photo.new(to_create)

    if @photo.save
      @user = @photo.user
      @new_photo = 'true'
      render "api/users/show_profile"
    else
      render json: {message: "photo failed to save"},
			status: 422
    end
  end

  private

  def set_cover_and_profile_photo_attrs(to_create)
    case @album.title
    when User::DEFAULT_ALBUM_TITLES[:profile]
        to_create[:profile] = true
        to_create[:cover] = false
    when User::DEFAULT_ALBUM_TITLES[:cover]
        to_create[:profile] = false
        to_create[:cover] = true
      else
        to_create[:profile] = false
        to_create[:cover] = false
    end
  end

  def photo_params
    params.require(:pic).permit(:img_url)
  end
end

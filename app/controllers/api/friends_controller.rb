class Api::FriendsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @friends = @user.friends

    render "api/friends/index"
  end

  def create
    options = friend_params
    options[:accepted] = false
    @friend_request = Friendship.new(options)
    if @friend_request.save
      render json: {message: "success"}
    else
      render json: {message: "failure"}
    end
  end

  private

  def friend_params
    params.require(:friend).permit(:requestor_id, :requestee_id)
  end
end

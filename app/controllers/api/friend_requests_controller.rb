class Api::FriendRequestsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @friends = @user.friend_requests

    render "api/friend_requests/index"
  end

  def update
    options = requestor_params;
    options[:requestee_id] = params[:user_id]

    @request = Friendship.where(options).first

    if (@request.update(accepted: true))
      render "api/friend_requests/approved_id"
    else
      render json: {message: "failed to approve"},
       status: 422
    end
  end

  def destroy
    options = requestor_params;
    options[:requestee_id] = params[:user_id]

    @request = Friendship.where(options).first

    if (@request.destroy)
      render "api/friend_requests/approved_id"
    else
      render json: {message: "failed to destroy"},
       status: 422
    end
  end

  private

  def requestor_params
    params.require(:requestor).permit(:requestor_id);
  end
end

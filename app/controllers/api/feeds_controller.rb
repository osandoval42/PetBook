class Api::FeedsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts= @user.feed_posts

    render 'api/posts/index'
  end
end

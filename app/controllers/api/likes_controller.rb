class Api::LikesController < ApplicationController
  def create
    @like = PostLike.new(like_params)

    if @like.save
      @post = Post.find(like_params[:post_id])
      render "api/posts/show"
    else
      render json: {message: "failure"}
    end
  end

  def destroy
    @like = PostLike.where(like_params)[0]

    if @like.destroy
      @post = Post.find(like_params[:post_id])
      render "api/posts/show"
    else
      render json: {message: "failure"}
    end
  end

  private

  def like_params
    params.require(:like).permit(:post_id, :user_id)
  end
end

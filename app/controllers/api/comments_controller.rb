class Api::CommentsController < ApplicationController
  def create
    @comment = PostComment.new(comment_params)

    if @comment.save
      @post = Post.find(@comment.post_id)
      render "api/posts/show"
    else
      render json: {message: "failure"}
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id, :user_id)
  end
end

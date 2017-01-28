class Api::PostsController < ApplicationController
  def index
    @posts = User.find(params[:user_id]).wall_posts #add include author and photo

    render "api/posts/index"
  end

  def create
    options = post_params
    options[:wall_id] = params[:user_id]

    @post = Post.new(options)

    if @post.save
      render "api/posts/show"
    else
      render json: {message: "failure"}
    end
  end


	def post_params
		params.require(:post).permit(:body, :author_id)
	end
end

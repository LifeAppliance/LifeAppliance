class Core::V1::PostsController < ApplicationController

	#GET /core/v1/Posts
	def index
		@posts = Post.NewestFirst
		render json: @posts, status: :ok
	end

	def show
		render json: @post
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			render json: @post, status: :created
		else
			render json: @post.errors, status: :unprocessable_entity
		end
	end

	def update
		@post = Post.find(params[:id])
		if @post.update_attributes(post_params)
			render json: @post
		else
			render json: @post.errors, status: :unprocessable_entity
		end
	end

	def destroy
		@post = Post.where(id: params[:id]).first
		if @post.destroy
			head(:ok)
		else
			head(:unprocessable_entity)
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_post
		@post = Post.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def post_params
		params.require(:post).permit(:caption, :post_image)
	end

end

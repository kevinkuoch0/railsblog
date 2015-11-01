class PostsController < ApplicationController
	before_action :set_post, only: [:edit, :update, :show, :destroy]
	def index
		@posts = Post.all
		@recent = Post.order("created_at DESC").limit(10)
	end

	def show
	end

	def new
		@post = Post.new
	end

	def edit
	end

	def destroy
		@post.destroy
		redirect_to posts_path, notice: "Post was deleted!"
	end

	def update
		@post.update(postparams)
		redirect_to posts_path
	end

	def create
		@post = Post.new(postparams.merge(user_id: current_user.id))
		if @post.save
			flash[:notice] = "Post created successfully!"
		else
			flash[:alert] = "Post was not created successfully."

		end
			# The same as typing in post_path(@post.id)
			redirect_to @post 

	end

	private

	def postparams
		params.require(:post).permit(:body, :user_id)
	end

	def set_post
		@post = Post.find(params[:id])
	end

end
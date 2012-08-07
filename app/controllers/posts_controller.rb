class PostsController < ApplicationController
	
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def edit
		@post = Post.find(params[:id])	
	end

	def create
		@post = Post.new(params[:post])
		@post.save

		redirect_to post_path(@post)

	end

	def destroy
		@post = Post.destroy(params[:id])

		redirect_to posts_path(@post)
	end

end

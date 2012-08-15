class PostsController < ApplicationController
#before_filter :authenticate_admin!, :except=> [:index, :show]
	
	
	def index
		@posts = Post.paginate(:page => params[:page], :per_page => 5)

		 respond_to do |format|
     format.html
     format.rss { render :layout => false } #index.rss.builder
   		end

		authorize! :read, @post
		
	end

	def show
		@post = Post.find(params[:id])
		@comment = Comment.new
		@comment.post_id = @post.id
		authorize! :read, @post
	end

	def new
			@post = Post.new
			authorize! :create, @post
	end

	def edit
		@post = Post.find(params[:id])
		authorize! :update, @post 
	end

	def create
		@post = Post.new(params[:post]) 
		@post.save 
		authorize! :create, @post

		redirect_to post_path(@post)

	end

	def update
	    @post = Post.find(params[:id])
	    @post.update_attributes(params[:post])
	    @post.save
	    authorize! :update, @post
	    redirect_to post_path(@post)
  end

	def destroy
		@post = Post.destroy(params[:id])
		authorize! :destroy, @post

		redirect_to posts_path(@post)
	end

	def current_user
		@current_user = current_admin
	end


end

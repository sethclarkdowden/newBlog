class CommentsController < ApplicationController
	def create
	    post_id = params[:comment].delete(:article_id)

	    @comment = Comments.new(params[:comment])
	    @comment.post_id = post_id

	    @comment.save

	    redirect_to post_path(@comment.post)
 	end

end

class CommentsController < ApplicationController
    def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.build(comment_params)
      @comment.user = User.first
  
      if @comment.save
        redirect_to @post, notice: "Comment added!"
      else
        redirect_to @post, alert: "Unable to add comment."
      end
    end
  
    def destroy
      @comment = Comment.find(params[:id])
      post = @comment.post
      if @comment.user == User.first
        @comment.destroy
        redirect_to post, notice: "Comment deleted."
      else
        redirect_to post, alert: "Not authorized."
      end
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:body)
    end
  end
  
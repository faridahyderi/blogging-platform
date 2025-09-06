class DashboardController < ApplicationController
    def index
      @posts = current_user.posts
    end
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to dashboard_path, notice: "Post deleted."
      end
  end
  
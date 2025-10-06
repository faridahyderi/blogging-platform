class DashboardController < ApplicationController
  before_action :require_login

    def index
      @posts = current_user.posts
    end
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to dashboard_path, notice: "Post deleted."
      end
  end
  
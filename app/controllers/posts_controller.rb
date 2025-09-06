class PostsController < ApplicationController
    def index
      @posts = Post.all
    end
  
    def show
      @post = Post.find(params[:id])
      @comments = @post.comments
      @comment = Comment.new
    end
  
    def new
      @post = Post.new
    end
  
    def create
        @post = User.first.posts.build(post_params)

      if @post.save
        redirect_to @post, notice: "Post was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit
      @post = Post.find(params[:id])
    end
  
    def update
      @post = Post.find(params[:id])
      if @post.update(post_params)
        redirect_to @post, notice: "Post was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to dashboard_path, notice: "Post deleted."
    end
  
    private
  
    def post_params
      params.require(:post).permit(:title, :body)
    end
  end
  
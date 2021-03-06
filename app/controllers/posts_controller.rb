class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.votes = 0
    if @post.save
      flash[:notice] = "Post successfully added!"
      redirect_to posts_path
    else
      flash[:alert] = "Post not added. Try again!"
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Post successfully updated!"
      redirect_to posts_path
    else
      flash[:alert] = "Post not updated. Try again!"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Post successfully deleted!"
    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:title, :link, :votes)
  end

end

class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    unless current_user.admin == true
      flash[:notice] = 'You do not have posting rights'
      redirect_to root_path
    end
  end

  def create
    @post = Post.create(post_params)
    redirect_to post_path(@post)
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end

class PostsController < ApplicationController

  def index
    @posts = Post.all.order(id: :desc)
  end

  def new
    unless admin?
      flash[:notice] = 'You do not have posting rights'
      redirect_to root_path
    end
    @post = Post.new
  end

  def create
    if admin?
      @post = Post.create(post_params)
      redirect_to post_path(@post)
    else
      flash[:notice] = 'You do not have posting rights'
      redirect_to root_path
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def admin?
    current_user.admin == true
  end

end

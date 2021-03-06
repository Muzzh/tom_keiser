class PostsController < ApplicationController

  def index
    @posts = Post.all.order(id: :desc)
  end

  def new
    unless current_user.admin?
      flash[:notice] = 'You do not have posting rights'
      redirect_to root_path
    end
    @post = Post.new
  end

  def create
    if current_user.admin?
      @post = current_user.posts.create(post_params)
      redirect_to post_path(@post)
    else
      flash[:notice] = 'You do not have posting rights'
      redirect_to root_path
    end
  end

  def edit
    if current_user.admin?
      @post = Post.find(params[:id])
    else
      flash[:notice] = 'You do not have posting rights'
      redirect_to root_path
    end
  end

  def update
    unless current_user.admin?
      flash[:notice] = 'You do not have posting rights'
      redirect_to root_path
    end
    @post = Post.find(params[:id])
    @post.update_attributes(post_params)
    redirect_to post_path(@post)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end

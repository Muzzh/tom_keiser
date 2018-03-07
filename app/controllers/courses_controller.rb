class CoursesController < ApplicationController

  def index
    @courses = Course.all
  end

  def new
    unless current_user.admin?
      flash[:notice] = 'You do not have posting rights'
      redirect_to root_path
    end
    @course = Course.new
  end

  def create
    if current_user.admin?
      @course = Course.create(course_params)
      redirect_to courses_path
    else
      flash[:notice] = 'You do not have posting rights'
      redirect_to root_path
    end
  end

  def edit
    if current_user.admin?
      @course = Course.find(params[:id])
    else
      flash[:notice] = 'You do not have posting rights'
      redirect_to root_path
    end
  end

  private

  def course_params
    params.require(:course).permit(:title, :body)
  end
end

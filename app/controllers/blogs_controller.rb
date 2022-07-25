class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.create(blog_params)
    if @blog.valid?
      flash[:notice] = "Blog Created Succesfully"
      redirect_to blogs_path
    else
      flash[:errors] = @blog.errors.full_messages
      redirect_to new_blog_path
    end
  end

  def show
    views = @blog.views + 1
    @blog.update(views: views)
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      flash[:notice] = "Blog Updated Successfully"
      redirect_to blog_path(@blog)
    else
      flash[:errors] = @blog.errors.full_messages
      redirect_to edit_blog_path
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: "Blog was successfully destroyed."
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :subtitle, :photo, :user_id)
  end
end

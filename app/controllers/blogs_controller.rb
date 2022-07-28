class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.create(blog_params)
    @blog.user = current_user
    if @blog.save
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
    @comments = @blog.comments.order("created_at DESC")
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

  def history
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :subtitle, :photo)
  end
end

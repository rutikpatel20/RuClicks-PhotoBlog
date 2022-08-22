class BlogsController < ApplicationController
  load_and_authorize_resource
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  add_breadcrumb "RuClicks", :root_path

  def index
    @query = Blog.ransack(params[:q])
    @blogs = @query.result(distinct: true).order("created_at DESC")
    if params[:category].blank?
      @blogs = Blog.all.page(params[:page]).order("created_at DESC")
    else
      @category_id = Category.find_by(category: params[:category]).id
      @blogs = Blog.where(category_id: @category_id).page(params[:page]).order("created_at DESC")
    end
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
    # Breadcrumb Navbar
    add_breadcrumb "#{@blog.category.category}", blogs_path, title: "Back to the Home"
    add_breadcrumb "#{@blog.title}", blog_path(@blog)
    # Views Update
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
    params.require(:blog).permit(:title, :subtitle, :photo, :thumbnail, :category_id, :blog_body)
  end
end

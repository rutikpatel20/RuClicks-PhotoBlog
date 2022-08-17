class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(like_params)
    if @like.save
      flash[:notice] = "Thank You For LIKE!!"
      redirect_to @like.blog
    else
      flash[:errors] = @like.errors.full_messages
    end
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    blog = @like.blog
    @like.destroy
    redirect_to blog
  end

  private

  def like_params
    params.require(:like).permit(:blog_id)
  end
end

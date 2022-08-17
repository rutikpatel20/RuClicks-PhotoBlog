class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(like_params)
    if !@like.save
      flash[:notice] = @like.errors.full_messages.to_sentence
    end
    redirect_to @like.blog
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

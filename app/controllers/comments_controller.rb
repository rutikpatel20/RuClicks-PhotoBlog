class CommentsController < ApplicationController
  before_action :find_commentable, only: [:create]
  before_action :set_comment, except: [:create]
  before_action :authenticate_user!

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user
    @comment.reply = true if params[:comment_id]
    @comment.save
    render :json => @comment.comments
  end

  def edit
  end

  def update
    # To Store Comment History
    if @comment.edit_history == ""
      @comment.edit_history = "Original: " + @comment.comment_body + "\n"
    else
      @comment.edit_history = @comment.edit_history + "Edit: " + params[:comment][:comment_body] + "\n"
    end
    @comment.update(comment_params)
    render :json => @comment
    # render :json => @comment.comments
  end

  def destroy
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_body)
  end

  def find_commentable
    # Comment
    if params[:comment_id]
      @commentable = Comment.find_by_id(params[:comment_id])
    elsif params[:blog_id]
      # Blog
      @commentable = Blog.find(params[:blog_id])
    end
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end

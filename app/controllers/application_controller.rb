class ApplicationController < ActionController::Base
  before_action :set_ransack_query

  def set_ransack_query
    @query = Blog.ransack(params[:q])
  end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to blogs_path, alert: exception.message }
    end
  end
end

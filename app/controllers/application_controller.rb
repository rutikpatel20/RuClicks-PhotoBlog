class ApplicationController < ActionController::Base
  before_action :set_ransack_query

  def set_ransack_query
    @query = Blog.ransack(params[:q])
  end
end

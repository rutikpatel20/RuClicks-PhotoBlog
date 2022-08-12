class ProfileController < ApplicationController
  before_action :set_user, only: [:show, :follow, :unfollow]

  def index
  end

  def show
  end

  def follow
    Relationship.create_or_find_by(follower_id: current_user.id, followee_id: @user.id)
    # render "profile/show"
  end

  def unfollow
    current_user.followed_users.where(follower_id: current_user.id, followee_id: @user.id).destroy_all
    # render "profile/show"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end

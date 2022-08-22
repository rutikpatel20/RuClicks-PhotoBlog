# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Blog, public: true

    return unless user.present?
    can :update, Blog do |blog|
      blog.user == user
    end
    can :destroy, Blog, user_id: user.id

    
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end

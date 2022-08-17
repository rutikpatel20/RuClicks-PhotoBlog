class Like < ApplicationRecord
  validates :user_id, uniqueness: { scope: :blog_id }
  belongs_to :user
  belongs_to :blog
end

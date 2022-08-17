class Blog < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  # has_one_attached :photo

  # To Resize the image
  has_one_attached :photo do |attachable|
    attachable.variant :thumb, resize_to_limit: [350, 350]
  end

  # Thumbnail Image
  has_one_attached :thumbnail do |attachable|
    attachable.variant :thumb, resize_to_limit: [350, 350]
  end

  # Pagination
  paginates_per 10

  belongs_to :category

  # Action Text for Blog Body
  has_rich_text :blog_body

  # Like Feature
  has_many :likes
end

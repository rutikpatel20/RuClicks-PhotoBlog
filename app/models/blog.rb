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
end

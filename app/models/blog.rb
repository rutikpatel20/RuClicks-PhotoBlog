class Blog < ApplicationRecord
  # has_one_attached :photo

  # To Resize the image
  has_one_attached :photo do |attachable|
    attachable.variant :thumb, resize_to_limit: [350, 350]
  end
end

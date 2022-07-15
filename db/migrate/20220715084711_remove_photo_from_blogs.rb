class RemovePhotoFromBlogs < ActiveRecord::Migration[6.1]
  def change
    remove_column :blogs, :photo
  end
end

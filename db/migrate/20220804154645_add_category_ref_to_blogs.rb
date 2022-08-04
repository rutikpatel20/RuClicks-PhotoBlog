class AddCategoryRefToBlogs < ActiveRecord::Migration[6.1]
  def change
    add_reference :blogs, :category
  end
end

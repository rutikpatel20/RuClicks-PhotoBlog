class RemoveBlogBodyFromBlogs < ActiveRecord::Migration[6.1]
  def change
    remove_column :blogs, :blog_body
  end
end

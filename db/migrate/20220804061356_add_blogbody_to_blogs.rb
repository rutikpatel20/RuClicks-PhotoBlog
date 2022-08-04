class AddBlogbodyToBlogs < ActiveRecord::Migration[6.1]
  def change
    add_column :blogs, :blog_body, :text
  end
end

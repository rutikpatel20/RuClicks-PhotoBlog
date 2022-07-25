class AddViewsToBlogs < ActiveRecord::Migration[6.1]
  def change
    add_column :blogs, :views, :integer, default: 0
  end
end

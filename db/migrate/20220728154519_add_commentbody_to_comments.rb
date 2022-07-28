class AddCommentbodyToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :comment_body, :string
  end
end

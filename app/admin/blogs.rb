ActiveAdmin.register Blog do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :subtitle, :views, :user_id, :photo, :thumbnail, :category_id, :blog_body

  form do |f|
    f.inputs "Blog" do
      f.input :title, placeholder: "Enter Title Here"
      f.input :subtitle, placeholder: "Enter Subtitle Here"
      f.input :views
      # Display input field - Number
      # f.input :user_id
      # Display Dropdown for users
      f.input :user
      f.input :category_id, label: "Category", as: :select, collection: Category.all.map { |c| [c.category, c.id] }
      f.rich_text_area :blog_body
      f.input :photo, as: :file
      f.input :thumbnail, as: :file
    end
    f.actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :subtitle, :views, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  # Index Page Modification
  index do
    selectable_column
    column :id
    column "Title" do |blog|
      link_to blog.title, admin_blog_path(blog)
    end
    column :subtitle
    column :user

    column :created_at
    column :updated_at
    actions
  end

  # Filters
  filter :user
  filter :title
  filter :subtitle
  filter :views

  filter :created_at
  filter :updated_at

  # Show Page Modification
  show do
    attributes_table do
      row :title
      row :subtitle
      row :user
      row :views
      row :created_at
      row :updated_at
      row :photo do |photo|
        image_tag url_for(photo.photo), style: "width: 20%"
      end
      row :thumbnail do |thumb|
        image_tag thumb.thumbnail, size: "300x300"
      end
    end
    active_admin_comments
  end
end

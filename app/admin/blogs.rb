ActiveAdmin.register Blog do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :subtitle, :views, :user_id, :photo, :thumbnail

  form do |f|
    f.inputs "Blog" do
      f.input :title, placeholder: "Enter Title Here"
      f.input :subtitle, placeholder: "Enter Subtitle Here"
      f.input :views
      # Display input field - Number
      # f.input :user_id
      # Display Dropdown for users
      f.input :user
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

end

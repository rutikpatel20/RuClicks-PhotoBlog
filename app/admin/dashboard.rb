# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    div class: "dashboard-header" do
      columns do
        column do
          para "Welcome to RuClicks - PhotoBlog"
        end
      end
    end

    panel "Latest Blogs" do
      table_for Blog.order(created_at: :desc).first(5).map do
        column "Title" do |blog|
          link_to blog.title, admin_blog_path(blog)
        end
        column :subtitle
        column :user
        column :created_at
        column :updated_at
      end
    end

    div class: "dashboard-footer" do
      columns do
        column do
          h3 "Made By Rutvik Patel"
        end
      end
    end
  end
end

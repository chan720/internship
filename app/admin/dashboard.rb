# frozen_string_literal: true

ActiveAdmin.register_page "Dashboard" do
  # menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  # content title: proc { I18n.t("active_admin.dashboard") } do
  #   div class: "blank_slate_container", id: "dashboard_default_message" do
  #     span class: "blank_slate" do
  #       span I18n.t("active_admin.dashboard_welcome.welcome")
  #       small I18n.t("active_admin.dashboard_welcome.call_to_action")
  #     end
  #   end
  content do
    div class: "welcome-message" do
      h2 "Welcome to the Balaj collection!"
    end

    # Example: Show a list of recent orders
    section "Recent Orders" do
      table_for Order.order("created_at desc").limit(5) do
        column :id
        column :user
        column :total_price
        column :created_at
      end
      strong { link_to "View All Orders", orders_path }
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end

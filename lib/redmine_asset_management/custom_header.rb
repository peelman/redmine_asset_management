module RedmineAssetManagement
  class CustomHeader < Redmine::Hook::ViewListener
    def view_layouts_base_html_head(context = {})
      stylesheet_link_tag 'ram.css', :plugin => 'redmine_asset_management'
    end
  end
end
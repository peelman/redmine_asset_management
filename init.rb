require 'redmine'
require 'dispatcher'

Dispatcher.to_prepare :redmine_asset_management do
  require_dependency 'issue'
  # Guards against including the module multiple time (like in tests)
  # and registering multiple callbacks
  Issue.send(:include, RedmineAssetManagement::IssuePatch) unless Issue.included_modules.include?(RedmineAssetManagement::IssuePatch)
  User.send(:include, RedmineAssetManagement::UserPatch) unless Issue.included_modules.include?(RedmineAssetManagement::UserPatch)
  ApplicationController.send(:include, RedmineAssetManagement::ApplicationControllerPatch) unless ApplicationController.included_modules.include?(RedmineAssetManagement::ApplicationControllerPatch)
#  Query.send(:include, RedmineAssetManagement::QueryPatch) unless Query.included_modules.include? RedmineAssetManagement::QueryPatch
end

require_dependency 'redmine_asset_management/custom_header'

Redmine::Plugin.register :redmine_asset_management do
  name 'Redmine Asset Management plugin'
  author 'Nick Peelman'
  author_url 'http://peelman.us'
  url 'http://github.com/peelman/redmine_asset_management'
  description 'Simple Asset Management for Redmine & ChiliProject'
  version '0.1.0'
    
  menu :top_menu, :assets, { :controller => :redmine_asset_management, :action => :index }, :caption => 'Asset Management'
  menu :admin_menu, :assets, {:controller => :redmine_asset_management, :action => :index }, :caption => 'Asset Management'

end

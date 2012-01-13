ActionController::Routing::Routes.draw do |map|
  map.connect 'ram', :controller => 'redmine_asset_management', :action => 'index'
  map.resources :assets, :licenses
end

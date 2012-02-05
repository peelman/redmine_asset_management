ActionController::Routing::Routes.draw do |map|
  map.resources :ram, :controller => 'redmine_asset_management', :only => [:index], :as => 'ram'
  map.resources :assets, :licenses, :pools
end

class RedmineAssetManagementController < ApplicationController
  unloadable
  
  def index
#    limit = per_page_option
    @assets_count = Asset.count
    @licenses_count = License.count
    @asset_statuses_count = AssetStatus.count
    @pool_statuses_count = PoolStatus.count

    @assets = Asset.find(:all,
                  :order => 'make ASC',
                  :limit => 10)
    @licenses = License.find(:all,
                  :order => 'name ASC',
                  :limit => 10)

    respond_to do |format|
      format.html { render :template => 'ram/index.html.erb', :layout => !request.xhr? }
    end
  end
  
end

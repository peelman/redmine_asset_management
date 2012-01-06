class DepartmentsController < ApplicationController
  unloadable
  
  def index
#    limit = per_page_option
    @assets_count = RAMAsset.count
    @licenses_count = RAMLicense.count

    @assets = RAMAsset.find(:all,
                  :order => 'make ASC')
    @licenses = RAMLicenses.find(:all,
                  :order => 'name ASC')

    respond_to do |format|
      format.html { render :template => 'assets/index.html.erb', :layout => !request.xhr? }
    end
  end
  
end

class AssetsController < ApplicationController
  unloadable
  
  def index

    @assets_count = Asset.count
    @assets = Asset.find(:all,
                  :order => 'make ASC')
    respond_to do |format|
      format.html { render :template => 'ram/assets/index.html.erb', :layout => !request.xhr? }
    end
  end

  def show
    @asset = Asset.find(params[:id])
    respond_to do |format|
      format.html { render :template => 'ram/assets/show.html.erb', :layout => !request.xhr? }
    end
  end

  def new
    @asset = Asset.new
    
    respond_to do |format|
      format.html { render :template => 'ram/assets/new.html.erb', :layout => !request.xhr?, :locals => { :statuses => @statuses } }
      format.js do
        render :update do |page|
          page.replace_html "assets", :partial => 'issues/assets', :locals => { :issue => @issue, :project => @project }
        end
      end
    end
  end

  def edit
    @asset = Asset.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def update
    @asset = Asset.find(params[:id])
    respond_to do |format|
      if @asset.update_attributes(params[:asset])
        flash[:notice] = 'Asset updated!'
        format.html { redirect_to @asset }
      else
        format.html { render :edit }
      end
    end
  end
  
  def addissue
    @issue = Issue.find(params[:issue_id])
    @project = @issue.project
    @asset = Asset.find(params[:asset][:asset_id])
    respond_to do |format|
      if @asset.issues<<@issue
        format.html
        format.js do
          render :update do |page|
            page.replace_html "issue-assets", :partial => 'issues/assets/list', :locals => {:asset => @asset, :issue => @issue, :project => @project}
          end
        end
      else
        format.js do
          render :update do |page|
            page.replace_html "issue-assets", :partial => 'issues/assets/list', :locals => {:asset => @asset, :issue => @issue, :project => @project}
          end
        end
      end
    end
  end
  
  def removeissue
    @issue = Issue.find(params[:issue_id])
    @project = @issue.project
    @asset = Asset.find(params[:asset_id])
    @source = params[:source];
    respond_to do |format|
      if @asset.issues.delete(@issue)
        format.html
        format.js do
          render :update do |page|
            if (@source == 'asset')
              page.replace_html "asset-issues", :partial => 'assets/issues/list', :locals => { :asset => @asset }
            elsif (@source == 'issue')
              page.replace_html "issue-assets", :partial => 'issues/assets/list', :locals => {:asset => @asset, :issue => @issue, :project => @project}
            else
              #do nothing
            end
          end
        end
      else
        format.js do
          render :update do |page|
            page.replace_html "assets", :partial => 'issues/assets', :locals => {:asset => @asset, :issue => @issue, :project => @project}
          end
        end
      end
    end
  end

  def create
    @asset = Asset.new(params[:asset])
    respond_to do |format|
      if @asset.save
        format.html { redirect_to assets_path }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @asset = Asset.find(params[:id])
    respond_to do |format|
      if @asset.destroy
        flash[:notice] = "Asset removed!"
        format.html { redirect_to :controller => 'assets', :action => 'index', :per_page => params[:per_page], :page => params[:page] }
        format.js { render(:update) { |page| page.replace_html "assets", :partial => 'assets/list', :locals => {:assets => @assets } } }
      else
        flash[:error] = "Couldn't delete asset"
        format.html { redirect_to :controller => 'assets', :action => 'index' }
        format.js { render(:update) { |page| page.replace_html "assets", :partial => 'assets/list', :locals => {:assets => @assets } } }          
      end
    end
  end

private
  def find_project
    @issue = Issue.find(params[:issue_id])
    @project = @issue.project
  rescue ActiveRecord::RecordNotFound
    render_404
  end
  
end

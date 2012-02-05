class PoolsController < ApplicationController
  unloadable
  
  def index
    @pools_count = Pool.count
    @pools = Pool.find(:all,
                  :order => 'name ASC')
    respond_to do |format|
      format.html { render :template => 'ram/pools/index.html.erb', :layout => !request.xhr? }
    end
  end

  def show
    @pool = Pool.find(params[:id])
    respond_to do |format|
      format.html { render :template => 'ram/pools/show.html.erb', :layout => !request.xhr? }
    end
  end

  def new
    @pool = Pool.new
    respond_to do |format|
      format.html { render :template => 'ram/pools/new.html.erb', :layout => !request.xhr? }
    end
  end

  def edit
    @pool = Pool.find(params[:id])
    respond_to do |format|
      format.html { render :template => 'ram/pools/edit.html', :layout => !request.xhr? }
    end
  end

  def update
    @pool = Pool.find(params[:id])
    @pool.updated_by = User.current
    respond_to do |format|
      if @pool.update_attributes(params[:pool])
        flash[:notice] = 'Pool updated!'
        format.html { redirect_to @pool }
      else
        format.html { render :edit }
      end
    end
  end
  
  def addchild
    
  end

  def create
    @pool = Pool.new(params[:pool])
    @pool.created_by = User.current
    @pool.updated_by = User.current
    respond_to do |format|
      if @pool.save
        format.html { redirect_to pools_path }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @pool = Pool.find(params[:id])
    respond_to do |format|
      if @pool.destroy
        flash[:notice] = "Pool removed!"
        format.html { redirect_to :controller => 'pools', :action => 'index', :per_page => params[:per_page], :page => params[:page] }
        format.js { render(:update) { |page| page.replace_html "pools", :partial => 'pools/list', :locals => {:pools => @pools } } }
      else
        flash[:error] = "Couldn't delete pool"
        format.html { redirect_to :controller => 'pools', :action => 'index' }
        format.js { render(:update) { |page| page.replace_html "pools", :partial => 'pools/list', :locals => {:pools => @pools } } }          
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

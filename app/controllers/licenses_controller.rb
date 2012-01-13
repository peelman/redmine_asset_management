class LicensesController < ApplicationController
  unloadable
  
  def index
    @licenses_count = License.count
    @licenses = License.find(:all,
                  :order => 'name ASC')
    respond_to do |format|
      format.html { render :template => 'ram/licenses/index.html.erb', :layout => !request.xhr? }
    end
  end

  def show
    @license = License.find(params[:id])
    respond_to do |format|
      format.html { render :template => 'ram/licenses/show.html.erb', :layout => !request.xhr? }
    end
  end

  def new
    @license = License.new
    respond_to do |format|
      format.html { render :template => 'ram/licenses/new.html.erb', :layout => !request.xhr? }
    end
  end

  def edit
    @license = License.find(params[:id])
    respond_to do |format|
      format.html { render :template => 'ram/licenses/edit.html', :layout => !request.xhr? }
    end
  end

  def update
    @license = License.find(params[:id])
    respond_to do |format|
      if @license.update_attributes(params[:license])
        flash[:notice] = 'License updated!'
        format.html { redirect_to @license }
      else
        format.html { render :edit }
      end
    end
  end
  
  def addissue
    @issue = Issue.find(params[:issue_id])
    @project = @issue.project
    @license = License.find(params[:license][:license_id])
    respond_to do |format|
      if @license.issues<<@issue
        format.html
        format.js do
          render :update do |page|
            page.replace_html "issue-licenses", :partial => 'ram/issues/licenses/list', :locals => {:license => @license, :issue => @issue, :project => @project}
          end
        end
      else
        format.js do
          render :update do |page|
            page.replace_html "issue-licenses", :partial => 'ram/issues/licenses/list', :locals => {:license => @license, :issue => @issue, :project => @project}
          end
        end
      end
    end
  end
  
  def removeissue
    @issue = Issue.find(params[:issue_id])
    @project = @issue.project
    @license = License.find(params[:license_id])
    @source = params[:source];
    respond_to do |format|
      if @license.issues.delete(@issue)
        format.html
        format.js do
          render :update do |page|
            if (@source == 'license')
              page.replace_html "license-issues", :partial => 'ram/licenses/issues/list', :locals => { :license => @license }
            elsif (@source == 'issue')
              page.replace_html "issue-licenses", :partial => 'ram/issues/licenses/list', :locals => {:license => @license, :issue => @issue, :project => @project}
            else
              #do nothing
            end
          end
        end
      else
        format.js do
          render :update do |page|
            page.replace_html "licenses", :partial => 'ram/issues/licenses', :locals => {:license => @license, :issue => @issue, :project => @project}
          end
        end
      end
    end
  end
  
  def new_license_add_contact
    @license = License.new
    @license.contacts.build
    respond_to do |format|
      format.html { render :partial => 'ram/licenses/contacts/new_ajax', :locals => { :license => @license } }
      format.js { render(:update) { |page| page.insert_html :bottom, 'contacts_form_list', :partial => 'ram/licenses/contacts/new_ajax', :locals => { :license => @license } } }
    end
  end

  
  def removecontact
    @license = License.find(params[:id])
    respond_to do |format|
      if @license.contacts.delete(Contact.find(params[:contact_id]))
        format.html { redirect_to @license }
        format.js do
          render :update do |page|
            page.replace_html "license-contacts", :partial => 'ram/licenses/contacts/list', :locals => {:license => @license, :issue => @issue, :project => @project}
          end
        end
      else
        format.js do
          render :update do |page|
            page.replace_html "licenses", :partial => 'ram/licenses/contacts/list', :locals => {:license => @license, :issue => @issue, :project => @project}
          end
        end
      end
    end
  end

  def create
    @license = License.new(params[:license])
    @license.created_by = User.current
    @license.updated_by = User.current
    respond_to do |format|
      if @license.save
        format.html { redirect_to licenses_path }
      else
        format.html { redirect_to new_license_path }
      end
    end
  end

  def destroy
    @license = License.find(params[:id])
    respond_to do |format|
      if @license.destroy
        flash[:notice] = "License removed!"
        format.html { redirect_to :controller => 'licenses', :action => 'index', :per_page => params[:per_page], :page => params[:page] }
        format.js { render(:update) { |page| page.replace_html "licenses", :partial => 'ram/licenses/list', :locals => {:licenses => @licenses } } }
      else
        flash[:error] = "Couldn't delete license"
        format.html { redirect_to :controller => 'licenses', :action => 'index' }
        format.js { render(:update) { |page| page.replace_html "licenses", :partial => 'ram/licenses/list', :locals => {:licenses => @licenses } } }          
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

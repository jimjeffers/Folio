class ProjectsController < InheritedResources::Base
  layout 'admin'
  respond_to :html, :xml, :json
  before_filter :login_required
end
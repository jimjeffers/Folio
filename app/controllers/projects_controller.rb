class ProjectsController < InheritedResources::Base
  layout 'admin'
  respond_to :html, :xml, :json
end
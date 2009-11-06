class ProjectsController < InheritedResources::Base
  layout 'site'
  respond_to :html, :xml, :json
end
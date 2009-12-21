class ProjectsController < InheritedResources::Base
  layout 'admin'
  respond_to :html, :xml, :json
  before_filter :login_required
  
  def sort
    if params[:project]
      params[:project].each_with_index do |id,index|
        Project.find(id).update_attribute(:position,index)
      end
    end
    render :text => 'Order successfully updated!'
  end
end
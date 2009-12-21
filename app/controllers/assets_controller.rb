class AssetsController < InheritedResources::Base
  layout 'admin'
  respond_to :html, :xml, :json
  belongs_to :project
  before_filter :login_required
  
  def create
    create! do |success,failure|
      success.html { redirect_to @project }
    end
  end
  
  def show
    super do |format|
      format.html { redirect_to @project }
    end
  end
  
  def sort
    if params[:asset]
      params[:asset].each_with_index do |id,index|
        Asset.find(id).update_attribute(:position,index)
      end
    end
    render :text => 'Order successfully updated!'
  end
end
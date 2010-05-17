class AssetsController < InheritedResources::Base
  layout 'admin'
  respond_to :html, :xml, :json
  belongs_to :project
  before_filter :login_required
  actions :all, :except => [ :create, :update]
  
  def create
    @project = Project.find(params[:project_id])
    @asset = User.new(params[:asset])
    if @asset.save
      flash[:notice] = 'Asset was successfully created.'
      if params[:asset][:image].blank?
        redirect_to @project
      else
        render :action => 'cropping'
      end
    else
      render :action => 'new'
    end
  end
  
  # PUT /assets/1
  def update
    @project = Project.find(params[:project_id])
    @asset = Asset.find(params[:id])
    if @asset.update_attributes(params[:asset])
      flash[:notice] = 'Asset was successfully updated.'
      if params[:asset][:image].blank?
        redirect_to(@project)
      else
        render :action => 'cropping'
      end
    else
      render :action => "edit"
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
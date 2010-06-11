class CategoriesController < InheritedResources::Base
  layout 'admin'
  respond_to :html, :xml, :json
  before_filter :login_required
  before_filter :get_categories
  
  def show
    super do |format|
      format.html { redirect_to categories_path }
    end
  end
  
  def sort
    if params[:category]
      params[:category].each_with_index do |id,index|
        Category.find(id).update_attribute(:position,index)
      end
    end
    render :text => 'Order successfully updated!'
  end
end
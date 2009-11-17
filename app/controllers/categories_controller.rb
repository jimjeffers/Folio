class CategoriesController < InheritedResources::Base
  layout 'admin'
  respond_to :html, :xml, :json
  before_filter :login_required
  
  def show
    super do |format|
      format.html { redirect_to categories_path }
    end
  end
end
class CategoriesController < InheritedResources::Base
  layout 'admin'
  respond_to :html, :xml, :json
  
  def show
    super do |format|
      format.html { redirect_to categories_path }
    end
  end
end
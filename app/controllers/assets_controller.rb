class AssetsController < InheritedResources::Base
  layout 'admin'
  respond_to :html, :xml, :json
  belongs_to :project
  
  def create
    create! do |success,failure|
      success.html { redirect_to @project }
    end
  end
end
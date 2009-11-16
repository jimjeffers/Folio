class SiteController < ActionController::Base
  layout 'site'
  
  def work
    @featured, @projects = Project.first_with_remainder
  end
end
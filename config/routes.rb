ActionController::Routing::Routes.draw do |map|
  # Resources
  map.resources :projects do |project|
    project.resources :assets
  end
  map.resources :categories
  
  # Customs
  map.spotlight '/work/:guid', :controller => 'site', :action => 'spotlight'
  map.work '/work', :controller => 'site', :action => 'work'
  map.about '/about', :controller => 'site', :action => 'about'
  map.inquire '/inqiure', :controller => 'site', :action => 'work'
  
  # Defaults
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  map.connect '/', :controller => 'site', :action => 'work'
end

ActionController::Routing::Routes.draw do |map|
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.resources :users

  map.resource :session

  # Resources
  map.resources :projects do |project|
    project.resources :assets
  end
  map.resources :categories
  
  # Customs
  map.spotlight '/work/:guid', :controller => 'site', :action => 'spotlight'
  map.work '/work', :controller => 'site', :action => 'work'
  map.about '/about', :controller => 'site', :action => 'about'
  map.inquire '/inquire', :controller => 'site', :action => 'inquire'
  
  # Defaults
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  map.connect '/', :controller => 'site', :action => 'work'
end

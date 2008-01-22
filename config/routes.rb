ActionController::Routing::Routes.draw do |map|

  map.resources :posts do |post|
    post.resources :comments
  end

  map.connect 'about', :controller => 'pages', :action => 'about'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

  map.root :controller => "pages"

end

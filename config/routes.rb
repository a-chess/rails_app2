Rails.application.routes.draw do
  
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  get 'users/new'
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  
  get 'static_pages/about',as: 'about'
  get 'static_pages/help',as: 'help'
  get 'static_pages/home',as: 'home'
  
  root :to => 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

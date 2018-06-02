Rails.application.routes.draw do
  get 'users/new'
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  
  root :to => 'users#new' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

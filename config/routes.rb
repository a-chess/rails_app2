Rails.application.routes.draw do
  
  get 'approval/index'
  get 'approvals/index'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users
  
  get 'timecards/index'
  get 'timecards/:id', to: 'timecards#show'
  get 'timecards/:id/edit', to: 'timecards#edit'
  patch 'timecards', to: 'timecards#update'
  
  get 'approval', to: 'approval#index'
  get 'approval/(:target)', to: 'approval#index'
  patch 'approval(:id)', to: 'approval#update'
  
  get 'static_pages/about',as: 'about'
  get 'static_pages/help',as: 'help'
  get 'static_pages/home',as: 'home'
  
  get 'tcmente', to: 'timecard_master_mente#index'
  post 'tcmente', to: 'timecard_master_mente#create'
  post 'tcmente/(:target_month)', to: 'timecard_master_mente#create_cal'
  
  root :to => 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

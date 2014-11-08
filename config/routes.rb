Rails.application.routes.draw do
  resources :assets

  #root to: 'visitors#index'
  devise_for :users
  resources :users
  
  devise_scope :user do
    root :to => 'devise/sessions#new'
  end
  
  get '/welcome' => "assets#index", as: :user_root

  
end

Rails.application.routes.draw do
  #root to: 'visitors#index'
  devise_for :users
  resources :users
  
  devise_scope :user do
    root :to => 'devise/sessions#new'
  end
  
  get '/welcome' => "visitors#index", as: :user_root

  
end

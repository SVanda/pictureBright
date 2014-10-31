Rails.application.routes.draw do
  #root to: 'visitors#index'
  devise_for :users
  resources :users
  
  devise_scope :user do
    root :to => 'devise/sessions#new'
  end
  
  #get '/welcome' => "visitors#index", as: :user_root
  get '/welcome' => "boxfile#index", as: :user_root

  match "/boxfile/index",   :as => "boxfile", :via => :get
  match "/boxfile/delete",  :as => "delete", :via => [:get, :post]
  match "/boxfile/add",     :as => "add", :via => :get
  match "/boxfile/upload",   :as => "upload", :via => :post
  
  
end

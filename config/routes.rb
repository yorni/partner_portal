Rails.application.routes.draw do
  resources :products do
    collection {post :search, to: 'products#index' }
  end
  resources :manufacturers
  resources :categories
  resources :users
  resources :sessions, only: [:create]
  resources :activity_logs, only: [:index]
  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'
  get 'create_first_user' => 'users#create_first_user'
  root :to => 'products#index'

  post '/api/cu_manufacturer', to: 'sync_catalogs#manufacturer_update'
  post '/api/cu_category', to: 'sync_catalogs#category_update'
  post '/api/cu_product', to: 'sync_catalogs#product_update'


end

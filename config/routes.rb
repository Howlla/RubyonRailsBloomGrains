Rails.application.routes.draw do
  resources :orders
  resources :products
  resources :add_on_tables
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root   'home#index'
  get    'auth'            => 'home#auth'

  # Get login token from Knock
  post   'user_token'      => 'user_token#create'

  # User actions
  # get    '/users'          => 'users#index'
  # get    '/users/current'  => 'users#current'
  # post   '/users/create'   => 'users#create'
  # patch  '/user/:id'       => 'users#update'
  # delete '/user/:id'       => 'users#destroy'
  resource :users do
    collection {
      get :start_verification
      get :check_verification
      get :me
    }
  end

  resource :addresses do
    collection{
      get :fetch
    }
  end
end

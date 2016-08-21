Rails.application.routes.draw do
  root to: 'home#index'
  namespace :admin do
    resources :dashboard, only: [:index]
    resources :events, only: [:new, :create, :edit, :update]
    # get '/edit/:name', to: 'venues#edit', as: :edit_venue
    resources :venues, param: :name, only: [:edit, :update]
  end
  resources :cart_events, only: [:create, :update, :destroy]
  resources :cart, only: [:index]
  resources :events, only: [:index] do
    get 'occurred', on: :collection
  end
  resources :users, only: [:new, :create, :edit, :update]
  resources :orders, only: [:index, :create, :show]
  resources :charges
  resources :venues, only: [:index]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/dashboard', to: 'users#show'
  get '/categories/:title', to: 'categories#show', as: :category
  get '/auth/twitter', as: :twitter_login
  get '/auth/twitter/callback', to: 'sessions#create'
  get '/:name', to: 'venues#show', as: :venue
  get '/:name/:title', to: 'events#show', as: :event
end

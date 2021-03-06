Rails.application.routes.draw do
  root 'static_pages#welcome'
  get 'static_pages/home'

  resources :days
  resources :meals
  resources :exercises

  resources :users, only: [:new, :create, :edit, :update, :destroy]

  resources :users, only: [:show] do 
    get 'goodnight', on: :member
    resources :foods#, :only [:new, :create, :edit, :update, :destroy]
  end

  resources :foods, only: [:show, :index, :create, :update] do 
    post 'add', on: :member
  end

  get '/signin', to: 'sessions#new', as: 'signin'
  post '/session', to: 'sessions#create', as: 'session'
  get '/session', to: 'sessions#destroy', as: 'logout'

  # get "/auth/:provider"
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  # get "/auth/github", as: "github_login"
  # get '/auth/github/callback', to: 'sessions#create'#, via: [:get, :post]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  root 'static_pages#welcome'
  get 'static_pages/home'
  resources :days
  resources :meals
  resources :exercises

  resources :users, only: [:new, :create, :edit, :update, :destroy]

  resources :users, only: [:show] do 
    resources :foods#, :only [:new, :create, :edit, :update, :destroy]
  end

  resources :foods, only: [:show, :index] do 
    post 'add', on: :member
  end

  get '/signin', to: 'sessions#new', as: 'signin'
  post '/session', to: 'sessions#create', as: 'session'
  delete '/session', to: 'sessions#destroy'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

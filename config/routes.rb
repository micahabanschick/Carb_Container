Rails.application.routes.draw do
  root 'static_pages#welcome'
  get 'static_pages/home'
  resources :days
  resources :meals
  resources :exercises
  resources :foods
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

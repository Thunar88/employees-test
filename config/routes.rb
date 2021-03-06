Rails.application.routes.draw do
  resources :sessions, only: %i[new create destroy]
  resources :users, only: %i[new create show edit]
  resources :employees
  root 'home#index'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end

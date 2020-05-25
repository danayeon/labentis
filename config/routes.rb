Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root to: 'projects#index'
  resources :users, only: [:new]
  resources :projects, only: [:index, :show]
  resources :teams
end

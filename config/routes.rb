Rails.application.routes.draw do
  devise_for :users
  root to: 'projects#index'
  resources :users, only: [:new]
  resources :projects, only: [:index, :show]
end

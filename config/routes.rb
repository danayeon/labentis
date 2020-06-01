Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root to: 'projects#index'
  resources :users, only: [:new, :show]
  resources :projects, only: [:index, :show, :new, :create] do
    resources :messages, only: [:index, :create]
  end
  resources :matches, only: [:new, :create, :edit, :update]
end

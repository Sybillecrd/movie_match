Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: "trailers#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :filters, only: [:new, :create]
  resources :trailers, only: :index
  resources :opinions, only: [:create, :new]
  resources :movies, only: [:create, :new] do
    resources :notifications, only: [:create]
    resources :seen_movies, only: [:create]
  end

  namespace :my do
    resources :movies, only: [:index, :show]
  end

end

Rails.application.routes.draw do
  devise_for :users
  root to: "filters#new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :filters, only: [:new, :create]
  resources :trailers, only: :index
  resources :opinions, only: [:create, :new]
  resources :movies, only: [:create, :new]

  namespace :my do
    resources :movies, only: [:index, :show]
  end

end

Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :filters, only: [:new, :create]
  resources :trailers, only: :index
  resources :opinions, only: [:create, :new]
  resources :movies, only: [:create, :new]

  namespace :my do
    resources :movies, only: :index
  end

end

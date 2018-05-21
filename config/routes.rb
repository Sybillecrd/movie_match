Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :filters, only: [:new, :create]
  resources :trailers, only: :index
  resources :opinions, only: [:create, :new]
  resources :movies, only: [:create, :new]

  namespace :my do
    constraints subdomain: 'my' do
      resources :movies, only: :index
    end
  end

end

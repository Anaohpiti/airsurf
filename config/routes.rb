Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :boards, only: [:show, :index, :create, :new] do
    resources :rentals, only: [:new, :create]
  end

  resources :rentals, only: [:show, :index, :edit, :update ]
  resource :profile, only: [:show] # GET /profile profiles#show

end

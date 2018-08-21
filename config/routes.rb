Rails.application.routes.draw do
  devise_for :users
  resources :users, except: [:index, :new, :create]
  devise_for :chefs
  resources :chefs, except: [:new, :create] do
    resources :menus, only: [:create, :update, :destroy]
  end
  resources :bookings do
    resources :reviews, only: [:new, :create]
  end
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

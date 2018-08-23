Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, only: [:show, :destroy]
  devise_for :chefs, controllers: { registrations: 'chefs/registrations', sessions: 'chefs/sessions' }
  resources :chefs, only: [:index, :show, :destroy] do
    resources :menus, only: [:create, :update, :destroy]
  end
  resources :bookings do
    resources :reviews, only: [:new, :create]
  end
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

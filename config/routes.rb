Rails.application.routes.draw do
  get 'bookings/show'
  get 'bookings/create'
  get 'bookings/edit'
  get 'bookings/update'
  get 'bookings/destroy'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, only: [:show, :destroy]
  devise_for :chefs, controllers: { registrations: 'chefs/registrations' }
  resources :chefs, only: [:index, :show, :destroy] do
    resources :menus, only: [:create, :update, :destroy]
  end
  resources :bookings do
    resources :reviews, only: [:new, :create]
  end
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do

  resources :categories
  root to: 'pages#home'

  devise_for :users
  resources :users, only: [:show]
  resources :events, except: [:destroy] do
    resources :registrations, only: [:create]
  end
  resources :profiles, only: [:new, :edit, :create, :update]
  resources :photos, only: [:destroy]
  resources :documents, only: [:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

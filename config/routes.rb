Rails.application.routes.draw do
  root 'pages#home'

  resources :comments, only: [:create, :destroy, :edit, :update]
  resources :posts, only: [:index, :show, :create, :destroy, :edit, :update] do
    member do
      post '/like', to: "likes#create", as: "like"
      delete '/like', to: "likes#destroy", as: "unlike"
    end
  end
  resources :follows, only: [:create, :destroy]

  get '/profile/:id', to: "users#show", as: "user"
  get '/profile/:id/following', to: "users#following", as: "following"
  get '/profile/:id/followers', to: "users#followers", as: "followers"
  post '/users/search', to: "users#search", as: :search
  get '/users/search', to: "users#search"

  devise_for :users, :controllers => { registrations: 'registrations' }
end
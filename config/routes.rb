Rails.application.routes.draw do
  devise_for :users
  root to:"musics#index"
  resources :users, only: [:show]

  resources :musics do
    resources :comments, only: :create
  end

  resources :genre, only: [:index, :show]
end
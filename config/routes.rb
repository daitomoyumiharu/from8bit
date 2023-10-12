Rails.application.routes.draw do
  devise_for :users
  root to:"musics#index"
  resources :users, only: [:show]

  resources :musics do
    resources :comments, only: :create
  end

  resources :genres, only: [:index, :show]
end
Rails.application.routes.draw do
  root to:"musics#index"

  resources :musics, only: [:index]
end
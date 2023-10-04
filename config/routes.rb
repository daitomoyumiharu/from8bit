Rails.application.routes.draw do
  root to:"musics#index"

  resources :musics, only: [:index, :new, :create]
end
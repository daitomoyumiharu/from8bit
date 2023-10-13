Rails.application.routes.draw do
  devise_for :users
  root to:"musics#index"
  resources :users, only: [:show]

  resources :musics do
    #originalsアクションへのルートを追加
    collection do
      get 'originals', to: 'musics#originals' 
    end
    resources :comments, only: :create
  end

  resources :genres, only: [:index, :show]

  resources :years, only: [:index, :show]

end
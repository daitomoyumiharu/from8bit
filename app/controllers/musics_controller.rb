class MusicsController < ApplicationController
  #ログアウト状態のユーザーが投稿ページへ遷移を試みると、ログインページへリダイレクトするよう設定
  before_action :authenticate_user!, except: [:index]


  
  def index
     @musics = Music.includes(:user).order("created_at DESC")
  end

  def new
    @music = Music.new
  end

  def create
    @music = Music.new(music_params.merge(user_id: current_user.id))
    if @music.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def music_params
    params.require(:music).permit(:game_name, :title, :description, :music_file, :year_id, :genre_id, :target, :image)
  end

end

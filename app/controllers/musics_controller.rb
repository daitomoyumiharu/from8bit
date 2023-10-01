class MusicsController < ApplicationController
  #ログアウト状態のユーザーが投稿ページへ遷移を試みると、ログインページへリダイレクトするよう設定
  before_action :authenticate_user!, except: [:index]


  
  def index
     @musics = Music.includes(:user).order("created_at DESC")
  end

  def new
    @music = Music.new
  end
end

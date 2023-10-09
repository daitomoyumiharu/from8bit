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
      puts "Validation errors:"
      puts @music.errors.full_messages 
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @music = Music.find(params[:id])
    @comment = Comment.new
    @comments = @music.comments.includes(:user).order(created_at: :desc)
  end

  def edit
    # ログインしているユーザー且つ編集ページのユーザーと一致していればeditファイルが読み込まれる
    if @music.user_id == current_user
    else
      redirect_to root_path
    end
  end

  def music_params
    params.require(:music).permit(:game_name, :title, :description, :music_file, :year_id, :genre_id, :target, :image)
  end

end

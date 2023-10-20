class MusicsController < ApplicationController
  # ログアウト状態のユーザーが投稿ページへ遷移を試みると、ログインページへリダイレクトするよう設定
  before_action :authenticate_user!, except: [:index]
  before_action :set_music, only: [:show, :edit, :update, :destroy]

  def index
    @search = Music.ransack(params[:q]) #検索オブジェクトの作成
    @musics = if params[:q].present?
      @search.result(distinct: true).includes(:user).order('created_at DESC')
    else
      Music.includes(:user).order('created_at DESC')
    end
  end

  def new
    @music = Music.new
  end

  def create
    @music = Music.new(music_params.merge(user_id: current_user.id))

    if @music.save
      redirect_to root_path
    else
      puts 'Validation errors:'
      puts @music.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @comment = Comment.new
    @comments = @music.comments.includes(:user).order(created_at: :desc)
  end

  def edit
    # ログインしているユーザー且つ編集ページのユーザーと一致していればeditファイルが読み込まれる
    return if @music.user_id == current_user.id

    redirect_to root_path
  end

  def update
    if @music.update(music_params)
      redirect_to music_path(@music)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    #ログイン状態のユーザーと一致している場合削除
    if @music.user_id == current_user.id
      @music.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def originals
    original_genre = Genre.find_by(name: 'オリジナル楽曲(original_music)')
    @original_musics = original_genre.musics
  end

  def music_params
    params.require(:music).permit(:game_name, :title, :description, :music_file, :year_id, :genre_id, :target, :image)
  end

  def set_music
    @music = Music.find(params[:id])
  end
end

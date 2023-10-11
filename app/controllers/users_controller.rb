class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    # ログインユーザーのページでなければリダイレクト
    unless @user == current_user
      redirect_to root_path 
      return
    end
    @musics = @user.musics.order(created_at: :desc)
  end
end
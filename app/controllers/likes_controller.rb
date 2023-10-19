class LikesController < ApplicationController
  before_action :set_music
  def create
    like = current_user.likes.build(music_id: params[:music_id])
    like.save
    render partial: 'likes/like', locals: { music: @music }
  end

  def destroy
    like = current_user.likes.find_by(music_id: @music.id)
    like.destroy
    render partial: 'likes/like', locals: { music: @music }
  end

  private

  def set_music
    @music = Music.find(params[:music_id])
  end
end

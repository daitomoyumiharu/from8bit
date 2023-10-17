class LikesController < ApplicationController
  before_action :set_music
  def create
    like = current_user.likes.build(music_id: params[:music_id])
    like.save
    respond_to do |format|
      format.js
    end
  end

  def destroy
    like = current_user.likes.find_by(music_id: @music.id)
    like.destroy
    respond_to do |format|
      format.js
    end
  end

  def set_music
    @music = Music.find(params[:music_id])
  end
end

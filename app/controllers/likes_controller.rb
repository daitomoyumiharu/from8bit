class LikesController < ApplicationController
  def create
    like = current_user.likes.build(music_id: params[:music_id])
    like.save
    redirect_to music_path(params[:music_id])
  end

  def destroy
    like = Like.find_by(music_id: params[:music_id], user_id: current_user.id)
    like.destroy
    redirect_to music_path(params[:music_id])
  end
end

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.create(comment_params)
    redirect_to music_path(@comment.music)  # コメントと結びつくmusicの詳細画面に遷移
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, music_id: params[:music_id])
  end
end

class RelationshipsController < ApplicationController
  def create
    follow = current_user.active_relationships.new(follwer_id: params[:user_id])
    follow.save
    redirect_to root_path
  end
end

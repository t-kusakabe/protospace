class LikesController < ApplicationController
  def create
    @prototype = Prototype.find(params[:prototype_id])
    @likes = Like.where(prototype_id: params[:prototype_id])
    @like = Like.where(user_id: current_user.id, prototype_id: params[:prototype_id])
    like = Like.where(prototype_id: params[:prototype_id], user_id: current_user.id)
    
    if like.present?
      Like.destroy(like)
    else
      current_user.likes.create(create_params)
    end
  end

  private
  def create_params
    params.permit(:prototype_id)
  end
end

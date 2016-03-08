class LikesController < ApplicationController
  def create
    @prototype = Prototype.find(params[:prototype_id])
    @likes = Like.where(prototype_id: params[:prototype_id])
    @like = set_like
    current_user.likes.create(create_params)
  end

  def destroy
    @prototype = Prototype.find(params[:prototype_id])
    @likes = Like.where(prototype_id: params[:prototype_id])
    Like.destroy(set_like)
  end

  private
  def create_params
    params.permit(:prototype_id)
  end

  def set_like
    Like.where(user_id: current_user.id, prototype_id: params[:prototype_id])
  end

end

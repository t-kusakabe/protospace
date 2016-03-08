class LikesController < ApplicationController

  def create
    @prototype = Prototype.find(params[:prototype_id])
    current_user.likes.create(create_params)
    @like = set_like
    set_likes
  end

  def destroy
    @prototype = Prototype.find(params[:prototype_id])
    Like.destroy(set_like)
    set_likes
  end

  private
  def create_params
    params.permit(:prototype_id)
  end

  def set_like
    Like.where(user_id: current_user.id, prototype_id: params[:prototype_id])
  end

  def set_likes
    @likes = Like.where(prototype_id: params[:prototype_id]).count
  end

end

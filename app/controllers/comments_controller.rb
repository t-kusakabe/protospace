class CommentsController < ApplicationController
  def create
    current_user.comments.create(create_params)
    @comments = Comment.where(prototype_id: params[:prototype_id])
  end

private
  def create_params
    params.permit(:content, :prototype_id)
  end
end

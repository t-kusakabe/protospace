class CommentsController < ApplicationController
  def create
    Comment.create(create_params)
    @comments = Comment.where(prototype_id: params[:prototype_id])
  end

private
# コメント投稿時のストロングパラメータ
  def create_params
    params.permit(:content, :prototype_id).merge(user_id: current_user.id)
  end
end

class CommentsController < ApplicationController
  def create
    Comment.create(comment_params)
    @comments = Comment.where(prototype_id: params[:prototype_id])
  end

private
# コメント投稿時のストロングパラメータ
  def comment_params
    params.permit(:comment, :prototype_id).merge(user_id: current_user.id)
  end
end

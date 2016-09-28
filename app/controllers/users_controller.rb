class UsersController < ApplicationController
  def show
    @prototypes = Prototype.where(user_id: params[:id]).page(params[:page]).per(5).includes(:user, :tags, :tags, :tag_taggings)
    @user = User.find(params[:id])
  end
end

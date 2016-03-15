class UsersController < ApplicationController
  def show
    @prototypes = Prototype.where(user_id: params[:id]).page(params[:page]).per(5)
    @user = User.find(params[:id])
  end
end

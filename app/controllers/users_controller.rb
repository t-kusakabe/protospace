class UsersController < ApplicationController
  def show
    @prototype_num = Prototype.where(user_id: current_user.id)
    @prototypes = @prototype_num.page(params[:page]).per(5)
  end
end

class UsersController < ApplicationController
  def show
    @prototypes = Prototype.all.page(params[:page]).per(8)
  end
end

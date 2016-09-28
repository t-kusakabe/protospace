class NewestsController < ApplicationController
  def index
    @prototypes = Prototype.page(params[:page]).per(5).order('created_at DESC').includes(:user)
    render 'prototypes/index'
  end
end

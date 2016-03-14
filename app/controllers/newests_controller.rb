class NewestsController < ApplicationController
  def index
    @prototypes = Prototype.page(params[:page]).per(5).order('created_at DESC')
  end
end

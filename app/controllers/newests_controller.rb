class NewestsController < ApplicationController
  def index
    @prototypes = Prototype.order('created_at DESC')
    render 'populars/index'
  end
end

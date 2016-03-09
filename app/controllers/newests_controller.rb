class NewestsController < ApplicationController
  def index
    @prototypes = Prototype.order('id DESC')
    render 'populars/index'
  end
end

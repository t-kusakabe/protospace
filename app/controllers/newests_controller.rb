class NewestsController < ApplicationController
  def index
    @prototypes = Prototype.order('created_at DESC')
  end
end

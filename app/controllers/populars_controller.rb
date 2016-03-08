class PopularsController < ApplicationController
  before_action :authenticate_user!

  def index
    @prototypes = Prototype.all
  end
end

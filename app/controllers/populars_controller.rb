class PopularsController < ApplicationController
  before_action :authenticate_user!

  def index
    @prototypes = Prototype.order('like_count DESC')
  end
end

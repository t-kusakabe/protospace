class PopularsController < ApplicationController
  before_action :authenticate_user!

  def index
    prototype_likes = Like.group(:prototype_id).order('count_prototype_id DESC').count(:prototype_id).keys
    prototype_ids = Prototype.where.not(id: prototype_likes).group(:id).count(:id).keys
    prototype_ids.each do |prototype|
      prototype_likes << prototype
    end
    @prototypes = prototype_likes.map{ |id| Prototype.find(id) }
  end
end

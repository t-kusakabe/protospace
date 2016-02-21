class ProtoController < ApplicationController
  def index
  end

  def new
    @proto = Prototype.new
    @proto.proto_thumbnails.build
  end

  def create
    Prototype.create(create_params)
    redirect_to action: index
  end

  private
  def create_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, proto_thumbnails_attributes: [:main_thumbnail, :sub_thumbnail1, :sub_thumbnail2]).merge(user_id: current_user.id)
  end
end

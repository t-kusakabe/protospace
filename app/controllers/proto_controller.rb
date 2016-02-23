class ProtoController < ApplicationController
  def index
  end

  def new
    @prototype = Prototype.new
    @prototype.proto_thumbnails.build
  end

  def create
    prototype = Prototype.create(create_params)
    if prototype.save
      redirect_to action: index
    else
      @prototype = Prototype.new(create_params)
      @prototype.proto_thumbnails.build
      @prototype.valid?
      flash.now[:alert] = 'Not Input'
      render :new
    end
  end

  private
  def create_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, proto_thumbnails_attributes: [:main_thumbnail, :sub_thumbnail1, :sub_thumbnail2]).merge(user_id: current_user.id)
  end
end

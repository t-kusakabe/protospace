class ProtoController < ApplicationController
  def show
    @prototype = Prototype.find(params[:id])
  end

  def new
    @prototype = Prototype.new
    @prototype.thumbnails.build
  end

  def create
    prototype = Prototype.new(create_params)
    if prototype.save
      redirect_to root_path
    else
      @prototype = Prototype.new(create_params)
      @prototype.thumbnails.build
      @prototype.valid?
      flash.now[:alert] = 'Not Input'
      render :new
    end
  end

  private
  def create_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, thumbnails_attributes: [:thumbnail, :status]).merge(user_id: current_user.id)
  end
end

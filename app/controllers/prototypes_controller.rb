class PrototypesController < ApplicationController
  def show
    @prototype = Prototype.find(params[:id])
    @comments = Comment.where(prototype_id: params[:id])
  end

  def new
    @prototype = Prototype.new
    @prototype.thumbnails.build
  end

  def create
    prototype = current_user.prototypes.new(create_params)
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

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
    @prototype.update(create_params)
    redirect_to :root
  end

  def destroy
    Prototype.find(params[:id]).destroy
    redirect_to :root
  end

  private
  def create_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, thumbnails_attributes: [:thumbnail, :status, :thumbnail_cache])
  end
end

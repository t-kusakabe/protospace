class PrototypesController < ApplicationController
  def index
    @prototypes = Prototype.page(params[:page]).per(5).order('like_count DESC').includes(:user, :tags)
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comments = Comment.where(prototype_id: params[:id])
    @likes = Like.where(prototype_id: params[:id]).count
    @like = Like.where(user_id: current_user.id, prototype_id: params[:id])
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
    binding.pry
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
    params.require(:prototype).permit(:title, :catch_copy, :concept, thumbnails_attributes: [:id, :thumbnail, :status, :thumbnail_cache]).merge(tag_list: params[:prototype][:tag])
  end
end

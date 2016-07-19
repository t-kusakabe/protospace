class PrototypesController < ApplicationController
  def index
    @prototypes = Prototype.page(params[:page]).per(5).order('like_count DESC').includes(:user)
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comments = Comment.where(prototype_id: params[:id]).includes(:user)
    @likes = Like.where(prototype_id: params[:id]).count
    @like = Like.where(user_id: current_user.id, prototype_id: params[:id])
  end

  def new
    @prototype = Prototype.new
    @prototype.thumbnails.build
  end

  def create
    @prototype = current_user.prototypes.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
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
    @prototype.update(prototype_params)
    redirect_to :root
  end

  def destroy
    Prototype.find(params[:id]).destroy
    redirect_to :root
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, thumbnails_attributes: [:id, :thumbnail, :status]).merge(tag_list: params[:prototype][:tag])
  end
end

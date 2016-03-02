class PrototypesController < ApplicationController
  def show
    @prototype = Prototype.find(params[:id])
    @comments = Comment.all
    @comment = Comment.new
  end

  def new
    @prototype = Prototype.new
    @prototype.thumbnails.build
  end

  def create
    if params[:commit] == 'comment'
      Comment.create(comment_params)
    end

    if params[:commit] == 'Publish'
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
  # プロトタイプ投稿時のストロングパラメータ
  def create_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, thumbnails_attributes: [:thumbnail, :status, :thumbnail_cache]).merge(user_id: current_user.id)
  end

  # コメント投稿時のストロングパラメータ
  def comment_params
    params.permit(:comment, :prototype_id).merge(user_id: current_user.id)
  end
end

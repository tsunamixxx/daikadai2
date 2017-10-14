class PicturesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_picture, only:[:edit, :update, :destroy]

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    # Picture.create(pictures_params)
    # redirect_to pictures_path, notice: "投稿しました！"
    @picture = Picture.new(pictures_params)
    @picture.user_id = current_user.id
    if @picture.save
      redirect_to pictures_path, notice: "写真を投稿しました！"
      NoticeMailer.sendmail_blog(@picture).deliver
    else
      render 'new'
    end
  end

  def edit
    # @picture = Picture.find(params[:id])
  end

  def update
    # @picture = Picture.find(params[:id])
    if @picture.update(pictures_params)
      redirect_to pictures_path, notice: "編集しました！"
    else
      render 'edit'
    end
    # @picture.update(pictures_params)
    # redirect_to pictures_path, notice: "編集しました！"
  end

  def destroy
    # @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to pictures_path, notice: "削除しました！"
  end

  private
    def pictures_params
      params.require(:picture).permit(:title, :content)
    end
    def set_picture
      @picture = Picture.find(params[:id])
    end
end

class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :show, :new, :edit, :update, :destroy]
  before_action :own_video?, only: [:show, :edit, :update, :destroy]

  def index
    @videos = Video.where(user_id: current_user.id).reverse_order.page(params[:page]).per(6)
  end

  def new
    if params[:back]
      @video = Video.new(video_params)
    else
      @video = Video.new
    end
  end

  def create
    @video = current_user.videos.build(video_params)
    @video.url.sub!(/open\?id=/, "file/d/")
    @video.url << "/preview"
    if @video.save
      PostMailer.post_mail(@video).deliver
      redirect_to videos_path, notice: "ビデオメモを作成しました！"
    else
      render 'new'
    end
  end

  def show
    @comments = @video.comments
    @comment = @video.comments.build
    @favorite = current_user.favorites.find_by(video_id: @video.id)
  end

  def edit
  end

  def update
    if @video.update(video_params)
      redirect_to videos_path, notice: "ビデオメモを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @video.destroy
    redirect_to videos_path, notice:"ビデオメモを削除しました！"
  end

  def confirm
    @video = current_user.videos.build(video_params)
    render :new if @video.invalid?
  end

  private

  def video_params
    params.require(:video).permit(:title, :url, :status, :image, :image_cache)
  end

  def set_video
    @video = Video.find(params[:id])
  end

  def own_video?
    if @video.user_id != current_user.id
      redirect_to root_path
    end
  end
end

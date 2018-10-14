class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  def index
    @videos = Video.all
  end

  def new
    if params[:back]
      @video = Video.new(video_params)
    else
      @video = Video.new
    end
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
      redirect_to videos_path, notice: "ビデオメモを作成しました！"
    else
      # 入力フォームを再描画します。
      render 'new'
    end
  end

  def show
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
    @video = Video.new(video_params)
    render :new if @video.invalid?
  end

  private
  
  def video_params
    params.require(:video).permit(:title, :url, :status)
  end

  def set_video
    @video = Video.find(params[:id])
  end
end

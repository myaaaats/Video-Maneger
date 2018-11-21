class FavoritesController < ApplicationController
  def index
    @favorites = current_user.favorites.page(params[:page]).per(6)
  end

  def create
    favorite = current_user.favorites.create(video_id: params[:video_id])
    redirect_to favorites_path, notice: "お気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to favorites_path, notice: "お気に入り解除しました"
  end
end

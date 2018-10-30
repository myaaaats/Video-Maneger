class CommentsController < ApplicationController
  # コメントを保存、投稿するためのアクションです。
  def create
    # Videoをパラメータの値から探し出し,Videoに紐づくcommentsとしてbuildします。
    @video = Video.find(params[:video_id])
    @comment = @video.comments.build(comment_params)
    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to video_path(@video), notice: '投稿できませんでした...' }
      end
    end
  end



  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to video_path(@comment.video_id), notice:"コメントを削除しました！"
  end

  private
  # ストロングパラメーター
  def comment_params
    params.require(:comment).permit(:video_id, :content)
  end
end

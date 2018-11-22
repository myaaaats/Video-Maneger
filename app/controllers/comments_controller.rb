class CommentsController < ApplicationController
  def create
    @video = Video.find(params[:video_id])
    @comment = @video.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.js { render :error }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    #comment投稿したときみたいにindex.js.erbを呼ぶ
      if @comment.destroy
        render 'index'
      end
  end

  private

  def comment_params
    params.require(:comment).permit(:video_id, :content)
  end
end

module VideosHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_videos_path
    elsif action_name == 'edit'
      video_path
    end
  end
end

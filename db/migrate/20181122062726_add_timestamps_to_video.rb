class AddTimestampsToVideo < ActiveRecord::Migration[5.1]
  def change
    add_timestamps :videos
  end
end

class AddImageToVideos < ActiveRecord::Migration[5.1]
  def change
    add_column :videos, :image, :text
  end
end

class AddConditionFromVideos < ActiveRecord::Migration[5.1]
  def change
    change_column :videos, :title, :string, null: false
    change_column :videos, :url, :text, null: false
    change_column :videos, :status, :string, null: false
    change_column :videos, :user_id, :integer, null: false
  end
end

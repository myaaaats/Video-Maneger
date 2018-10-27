class AddConditionFromComments < ActiveRecord::Migration[5.1]
  def change
    change_column :comments, :video_id, :bigint, null: false
    change_column :comments, :content, :text, null: false
  end
end

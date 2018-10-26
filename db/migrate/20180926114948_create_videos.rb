class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.string :title, :null => false
      t.text :url, :null => false
      t.string :status, :null => false
      t.integer :user_id, :null => false
    end
  end
end

class AddDefaultTimeToVideo < ActiveRecord::Migration[5.1]
  def change
    change_column :videos, :created_at, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
    change_column :videos, :updated_at, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
  end
end

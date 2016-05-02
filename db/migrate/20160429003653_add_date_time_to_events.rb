class AddDateTimeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :datetime, :timestamp
    add_index :events, :datetime
  end
end

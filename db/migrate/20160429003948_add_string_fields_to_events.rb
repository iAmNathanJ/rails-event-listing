class AddStringFieldsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :city, :string
    add_column :events, :state, :string
    add_column :events, :venue, :string
  end
end

class AddTextFieldsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :image, :text
    add_column :events, :description, :text
  end
end

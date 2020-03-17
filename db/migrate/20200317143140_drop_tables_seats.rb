class DropTablesSeats < ActiveRecord::Migration[6.0]
  def change
    drop_table :economy_classes
    drop_table :first_classes
  end
end

class DropTables < ActiveRecord::Migration[6.0]
  def change
    drop_table :business_classes
  end
end
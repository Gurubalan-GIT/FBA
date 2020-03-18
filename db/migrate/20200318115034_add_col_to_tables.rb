class AddColToTables < ActiveRecord::Migration[6.0]
  def change
    add_column :passengers, :age, :integer
  end
end

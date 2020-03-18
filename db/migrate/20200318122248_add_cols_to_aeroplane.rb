class AddColsToAeroplane < ActiveRecord::Migration[6.0]
  def change
    add_column :aeroplanes, :fc_fare, :integer
    add_column :aeroplanes, :bc_fare, :integer
    add_column :aeroplanes, :ec_fare, :integer
  end
end

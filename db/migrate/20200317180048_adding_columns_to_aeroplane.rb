class AddingColumnsToAeroplane < ActiveRecord::Migration[6.0]
  def change
    add_column :aeroplanes, :fc_column, :integer
    add_column :aeroplanes, :fc_row, :integer
    add_column :aeroplanes, :bc_column, :integer
    add_column :aeroplanes, :bc_row, :integer
    add_column :aeroplanes, :ec_column, :integer
    add_column :aeroplanes, :ec_row, :integer
  end
end

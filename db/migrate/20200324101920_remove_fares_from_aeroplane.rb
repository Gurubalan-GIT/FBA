class RemoveFaresFromAeroplane < ActiveRecord::Migration[6.0]
  def change
    remove_column :aeroplanes, :fc_fare
    remove_column :aeroplanes, :bc_fare
    remove_column :aeroplanes, :ec_fare
  end
end

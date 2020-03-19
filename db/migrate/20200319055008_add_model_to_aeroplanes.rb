class AddModelToAeroplanes < ActiveRecord::Migration[6.0]
  def change
    add_column :aeroplanes, :model, :integer
  end
end

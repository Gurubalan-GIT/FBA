class RenameAeroplaneType < ActiveRecord::Migration[6.0]
  def change
    rename_column :aeroplanes, :type, :plane
  end
end

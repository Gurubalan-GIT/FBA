class AddFaresToTrips < ActiveRecord::Migration[6.0]
  def change
    add_column :trips, :fcfare, :integer
    add_column :trips, :bcfare, :integer
    add_column :trips, :ecfare, :integer
  end
end

class AddFareToTrips < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :fcfare, :integer
    add_column :tickets, :bcfare, :integer
    add_column :tickets, :ecfare, :integer
  end
end

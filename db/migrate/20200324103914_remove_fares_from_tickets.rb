class RemoveFaresFromTickets < ActiveRecord::Migration[6.0]
  def change
    remove_column :tickets, :fcfare
    remove_column :tickets, :bcfare
    remove_column :tickets, :ecfare
  end
end

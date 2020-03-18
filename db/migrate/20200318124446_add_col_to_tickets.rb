class AddColToTickets < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :seat_class, :string
    add_column :tickets, :seat_no, :string
  end
end

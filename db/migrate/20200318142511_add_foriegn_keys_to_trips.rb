class AddForiegnKeysToTrips < ActiveRecord::Migration[6.0]
  def change
    add_reference :tickets, :trip, null: false, foreign_key: true
    add_reference :tickets, :passenger, null: false, foreign_key: true
  end
end

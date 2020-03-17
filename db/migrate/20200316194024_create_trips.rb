class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.string :origin
      t.string :destination
      t.datetime :departure
      t.datetime :arrival

      t.timestamps
    end
  end
end

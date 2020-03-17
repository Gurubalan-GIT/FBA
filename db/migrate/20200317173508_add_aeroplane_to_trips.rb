class AddAeroplaneToTrips < ActiveRecord::Migration[6.0]
  def change
    add_reference :trips, :aeroplane, null: false, foreign_key: true
  end
end

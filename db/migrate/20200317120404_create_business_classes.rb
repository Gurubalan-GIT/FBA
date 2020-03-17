class CreateBusinessClasses < ActiveRecord::Migration[6.0]
  def change
    create_table :business_classes do |t|
      t.integer :seats
      t.references :aeroplane, null: false, foreign_key: true

      t.timestamps
    end
  end
end

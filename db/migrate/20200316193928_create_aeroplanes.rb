class CreateAeroplanes < ActiveRecord::Migration[6.0]
  def change
    create_table :aeroplanes do |t|
      t.string :type
      t.integer :seats

      t.timestamps
    end
  end
end

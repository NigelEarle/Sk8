class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.string :name
      t.string :description
      t.string :time
      t.string :days
      t.string :days
      t.integer :rating
      t.references :photos, index: true

      t.timestamps
    end
  end
end

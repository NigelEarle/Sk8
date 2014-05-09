class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.string :name
      t.string :description
      t.time :time
      t.string :days
      t.integer :rating
      t.string :address
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end

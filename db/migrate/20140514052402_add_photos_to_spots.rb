class AddPhotosToSpots < ActiveRecord::Migration
  def change
    add_attachment :spots, :avatar
  end
end

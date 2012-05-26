class CreateTempLocations < ActiveRecord::Migration
  def change
    create_table :temp_locations do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :city
      t.string :state
      t.string :country
      t.timestamps
    end
  end
end

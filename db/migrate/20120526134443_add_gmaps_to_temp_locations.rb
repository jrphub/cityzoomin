class AddGmapsToTempLocations < ActiveRecord::Migration
  def change
    add_column :temp_locations, :gmaps, :boolean, :after => :country
  end
end

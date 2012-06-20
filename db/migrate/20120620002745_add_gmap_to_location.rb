class AddGmapToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :gmaps, :boolean, :after => :longitude, :null=>false, :default=>true
  end
end

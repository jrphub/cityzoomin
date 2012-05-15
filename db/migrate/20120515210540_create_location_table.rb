class CreateLocationTable < ActiveRecord::Migration
  def up
    remove_column :microposts, :location
    create_table :locations do |r|
      r.string :name, :null => false
      r.string :city, :null => false
      r.decimal :latitude, :precision => 6, :scale => 6
      r.decimal :longitude, :precision => 6, :scale => 6
      # for FLOAT(M,D), M >= D has to be satisfied
      r.timestamps
    end
    add_index :locations, [:name, :city], :unique => true, :name => "unique_locations"
    add_column :microposts, :location_id, :integer, :null => false, :after => :city
  end

  def down
    remove_column :microposts, :location_id
    remove_index :locations, :name => "unique_locations"
    drop_table :locations
    add_column :microposts, :location, :string
  end
end

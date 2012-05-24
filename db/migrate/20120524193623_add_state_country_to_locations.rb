class AddStateCountryToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :state, :string, :null => false, :after => :city
    add_column :locations, :country, :string, :null=>false, :after => :state
  end
end

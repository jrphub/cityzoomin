class AddNullColumnsToLocation < ActiveRecord::Migration
  def change
    change_column :locations, :city, :string, :null => true
    change_column :locations, :state, :string, :null => true
    change_column :locations, :country, :string, :null => true
  end
end

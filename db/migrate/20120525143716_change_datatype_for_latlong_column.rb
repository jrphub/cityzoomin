class ChangeDatatypeForLatlongColumn < ActiveRecord::Migration
  def up
    change_column :locations, :latitude, :float
    change_column :locations, :longitude, :float
  end

  def down
    change_column :locations, :latitude, :integer, :precision => 6, :scale => 6
    change_column :locations, :longitude, :integer, :precision => 6, :scale => 6
  end
end

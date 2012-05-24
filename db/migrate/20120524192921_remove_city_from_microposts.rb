class RemoveCityFromMicroposts < ActiveRecord::Migration
  def up
    remove_column :microposts, :city
  end

  def down
    add_column :microposts, :city
  end
end

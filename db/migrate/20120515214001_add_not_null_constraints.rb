class AddNotNullConstraints < ActiveRecord::Migration
  def up
    change_column :users, :name, :string, :null => false
    change_column :users, :email, :string, :null => false
    change_column :microposts, :city, :string, :null => false
    change_column :microposts, :title, :string, :null => false
    change_column :microposts, :category, :string, :null => false
    change_column :microposts, :user_id, :integer, :null => false
  end

  def down
    change_column :microposts, :user_id, :integer, :null => true
    change_column :microposts, :category, :string, :null => true
    change_column :microposts, :title, :string, :null => true
    change_column :microposts, :city, :string, :null => true
    change_column :users, :email, :string, :null => true
    change_column :users, :name, :string, :null => true
  end
end

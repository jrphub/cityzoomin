class AddHaspicToComment < ActiveRecord::Migration
  def change
    add_column :comments, :has_pic, :integer, :after => :email, :null=>false, :default=>0
  end
end

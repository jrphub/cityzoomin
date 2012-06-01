class AddTempPasswordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :temp_password, :string, :null => true, :after => :remember_token
  end
end

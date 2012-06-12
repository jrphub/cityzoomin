class AddTempPasswordToUsers < ActiveRecord::Migration
  class User<ActiveRecord::Base
  end
  def change
    add_column :users, :temp_password, :string, :null => true, :after => :remember_token
    add_column :users, :signin_at, :timestamp, :null => true, :after => :temp_password
    User.reset_column_information
  end
end

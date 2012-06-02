class AddTempPasswordToUsers < ActiveRecord::Migration
  class User<ActiveRecord::Base
  end
  def change
    add_column :users, :temp_password, :string, :null => true, :after => :remember_token
    User.reset_column_information
  end
end

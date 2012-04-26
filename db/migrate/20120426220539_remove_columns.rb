class RemoveColumns < ActiveRecord::Migration
  def up
    remove_column :users, :encrypted_password
  end

  def down
    add_column :users, :password_digest, :string
  end
end

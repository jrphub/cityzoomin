class AddUsernameEmailToComment < ActiveRecord::Migration
  def change
    add_column :comments, :username, :string, :after => :micropost_id, :null=>false
    add_column :comments, :email, :string, :after => :username, :null=>false
  end
end

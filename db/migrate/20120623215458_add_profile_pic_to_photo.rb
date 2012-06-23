class AddProfilePicToPhoto < ActiveRecord::Migration
  def change
    remove_column :photos, :is_profile
    add_column :photos, :profile_pic, :integer, :after => :micropost_id, :null=>false, :default=>0
  end
end

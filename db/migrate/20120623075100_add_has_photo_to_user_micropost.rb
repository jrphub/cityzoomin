class AddHasPhotoToUserMicropost < ActiveRecord::Migration
  def change
    add_column :users, :has_pic, :boolean, :after => :signin_at, :null=>false, :default=>false
    add_column :microposts, :has_photo, :boolean, :after => :content, :null=>false, :default=>false
  end
end

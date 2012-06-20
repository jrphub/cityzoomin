class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :url, :null => 'false'
      t.references :user, :null => false
      t.references :micropost
      t.boolean :is_profile
      t.timestamps
    end
  end
end

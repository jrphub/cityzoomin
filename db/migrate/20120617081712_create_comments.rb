class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :description, :null=>false
      t.references :user, :null=>false
      t.references :micropost, :null=>false
      t.timestamps
    end
  end
end

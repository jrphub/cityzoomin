class AddMicropostsTags < ActiveRecord::Migration
  def change
    create_table :microposts_tags do |t|
      t.references :micropost, :null => false
      t.references :tag, :null => false
    end
  end
end

class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string  :label, :unique => true
      t.integer :count

      t.timestamps
    end

    remove_column :microposts, :category
  end
end

class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.integer :photo_id, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end

    add_index :taggings, :user_id
    add_index :taggings, :photo_id
    add_index :taggings, [:photo_id, :user_id], unique: true
  end
end

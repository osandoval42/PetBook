class CreatePhotoComments < ActiveRecord::Migration
  def change
    create_table :photo_comments do |t|
      t.integer :photo_id, null: false
      t.integer :user_id, null: false
      t.text :comment, null: false

      t.timestamps null: false
    end

    add_index :photo_comments, :photo_id
    add_index :photo_comments, :user_id
  end
end

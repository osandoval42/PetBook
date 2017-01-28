class CreatePhotoLikes < ActiveRecord::Migration
  def change
    create_table :photo_likes do |t|
      t.integer :user_id, null: false
      t.integer :photo_id, null: false

      t.timestamps null: false
    end

    add_index :photo_likes, :user_id
    add_index :photo_likes, :photo_id
    add_index :photo_likes, [:photo_id, :user_id], unique: true
  end
end

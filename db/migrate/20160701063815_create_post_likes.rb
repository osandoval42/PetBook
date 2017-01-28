class CreatePostLikes < ActiveRecord::Migration
  def change
    create_table :post_likes do |t|
      t.integer :post_id, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end

    add_index :post_likes, :post_id
    add_index :post_likes, :user_id
  end
end

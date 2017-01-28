class CreatePostComments < ActiveRecord::Migration
  def change
    create_table :post_comments do |t|
      t.integer :post_id, null: false
      t.integer :user_id, null: false
      t.text :body, null: false

      t.timestamps null: false
    end

    add_index :post_comments, :post_id
    add_index :post_comments, :user_id
  end
end

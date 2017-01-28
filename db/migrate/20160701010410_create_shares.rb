class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.integer :user_id, null: false
      t.integer :post_id, null: false

      t.timestamps null: false
    end

    add_index :shares, :user_id
    add_index :shares, :post_id
    add_index :shares, [:post_id, :user_id], unique: true
  end
end

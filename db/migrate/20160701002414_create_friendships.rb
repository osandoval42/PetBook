class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :requestor_id, null: false
      t.integer :requestee_id, null: false
      t.boolean :accepted, null: false, default: false

      t.timestamps null: false
    end


        add_index :friendships, :requestor_id
        add_index :friendships, :requestee_id
        add_index :friendships, [:requestor_id, :requestee_id], unique: true
  end
end

class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :requestor_id, null: false
      t.integer :requestee_id, null: false
      t.boolean :accepted, null: false, default: false

      t.timestamps null: false
    end

    add_index :relationships, :requestor_id, unique: true
    add_index :relationships, :requestee_id, unique: true
  end
end

class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :caption
      t.date :date

      t.timestamps null: false
    end

    add_index :albums, [:user_id, :title], unique: true
    add_index :albums, :user_id
  end
end

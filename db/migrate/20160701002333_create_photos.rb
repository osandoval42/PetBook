class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :album_id, null: false
      t.string :img_url, null: false
      t.boolean :profile, default: false
      t.boolean :cover, default: false
      t.date :date, null: false
      t.text :caption

      t.timestamps null: false
    end

     add_index :photos, :album_id
     add_index :photos, [:img_url, :album_id], unique: false
  end
end

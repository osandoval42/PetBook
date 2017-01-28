class RemoveColumn < ActiveRecord::Migration
  def change
    remove_column :posts, :date
  end
end

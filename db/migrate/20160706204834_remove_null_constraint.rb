class RemoveNullConstraint < ActiveRecord::Migration
  def change
    change_column_null(:photos, :profile, true)
  end
end

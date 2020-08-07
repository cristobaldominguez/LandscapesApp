class AddDeletedAtLandscapeAndComment < ActiveRecord::Migration[5.2]
  def change
    add_column :landscapes, :deleted_at, :datetime
    add_column :comments, :deleted_at, :datetime
    add_index :landscapes, :deleted_at
    add_index :comments, :deleted_at
  end
end

class AddTitleToLandscape < ActiveRecord::Migration[5.2]
  def change
    add_column :landscapes, :title, :string
  end
end

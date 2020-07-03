class AddDescriptionToLandscape < ActiveRecord::Migration[5.2]
  def change
    add_column :landscapes, :description, :text
  end
end

class CreateLandscapeCategory < ActiveRecord::Migration[5.2]
  def change
    create_table :landscape_categories do |t|
      t.references :landscape, foreign_key: true
      t.references :category, foreign_key: true
    end
  end
end

class CreateJoinTableLandscapeTag < ActiveRecord::Migration[5.2]
  def change
    create_join_table :landscapes, :tags do |t|
      t.references :landscape, foreign_key: true
      t.references :tag, foreign_key: true
    end
  end
end

class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :landscape, foreign_key: true
      t.boolean :active, default: true
      t.text :text

      t.timestamps
    end
  end
end

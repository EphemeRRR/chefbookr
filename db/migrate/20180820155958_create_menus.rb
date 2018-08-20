class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.integer :price
      t.integer :courses
      t.text :description
      t.references :chef, foreign_key: true
      t.integer :category
      t.string :photo_id

      t.timestamps
    end
  end
end

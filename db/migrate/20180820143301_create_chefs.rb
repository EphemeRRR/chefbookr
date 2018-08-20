class CreateChefs < ActiveRecord::Migration[5.2]
  def change
    create_table :chefs do |t|
      t.string :first_name
      t.string :last_name
      t.integer :experience
      t.string :location
      t.string :photo_id
      t.boolean :availability
      t.string :phone

      t.timestamps
    end
  end
end

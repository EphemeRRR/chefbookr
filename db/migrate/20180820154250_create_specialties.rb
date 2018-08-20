class CreateSpecialties < ActiveRecord::Migration[5.2]
  def change
    create_table :specialties do |t|
      t.integer :name
      t.string :chef, foreign_key: true

      t.timestamps
    end
  end
end

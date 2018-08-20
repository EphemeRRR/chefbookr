class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.integer :price
      t.date :start_date
      t.date :end_date
      t.references :menu, foreign_key: true
      t.integer :menu_count
      t.text :comment

      t.timestamps
    end
  end
end

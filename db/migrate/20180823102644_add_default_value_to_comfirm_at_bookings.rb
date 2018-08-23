class AddDefaultValueToComfirmAtBookings < ActiveRecord::Migration[5.2]
  def change
    change_column_default :bookings, :confirm, to: false
  end
end

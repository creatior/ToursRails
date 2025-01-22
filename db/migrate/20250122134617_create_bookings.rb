class CreateBookings < ActiveRecord::Migration[8.0]
  def change
    create_table :bookings do |t|
      t.references :client, null: false, foreign_key: true
      t.references :tour, null: false, foreign_key: true
      t.date :booking_date

      t.timestamps
    end
  end
end

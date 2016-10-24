class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.datetime :booking_from, null: false
      t.integer :duration, null: false
      t.integer :quantity, null: false
      t.integer :state, null: false
      t.references :user, index: true, foreign_key: true
      t.references :space, index: true, foreign_key: true
      t.references :booking_type, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true
      t.timestamps
    end
  end
end

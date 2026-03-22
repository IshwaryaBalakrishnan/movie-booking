class CreateBookings < ActiveRecord::Migration[8.1]
  def change
    create_table :bookings do |t|
      t.string :name
      t.string :email
      t.integer :seats
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end

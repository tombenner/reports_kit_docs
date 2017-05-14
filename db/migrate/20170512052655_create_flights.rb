class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.datetime :flight_at
      t.string :number
      t.integer :carrier_id
      t.integer :origin_airport_id
      t.integer :origin_market_id
      t.integer :destination_airport_id
      t.integer :destination_market_id
      t.integer :delay

      t.timestamps
    end

    add_index :flights, :flight_at
    add_index :flights, :carrier_id
    add_index :flights, :origin_airport_id
    add_index :flights, :origin_market_id
    add_index :flights, :destination_airport_id
    add_index :flights, :destination_market_id
  end
end

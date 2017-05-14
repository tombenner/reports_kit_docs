class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.datetime :flight_at
      t.string :carrier_key

      t.timestamps
    end
  end
end

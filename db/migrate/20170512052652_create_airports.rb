class CreateAirports < ActiveRecord::Migration[5.1]
  def change
    create_table :airports do |t|
      t.string :code
      t.string :name
      t.integer :market_id

      t.timestamps
    end

    add_index :airports, :code
    add_index :airports, :market_id
  end
end

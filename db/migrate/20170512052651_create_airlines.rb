class CreateAirlines < ActiveRecord::Migration[5.1]
  def change
    create_table :airlines do |t|
      t.string :code
      t.string :name

      t.timestamps
    end

    add_index :airlines, :code
  end
end

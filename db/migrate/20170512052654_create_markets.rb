class CreateMarkets < ActiveRecord::Migration[5.1]
  def change
    create_table :markets do |t|
      t.string :code
      t.string :name

      t.timestamps
    end

    add_index :markets, :code
  end
end

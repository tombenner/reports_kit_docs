class CreateCarriers < ActiveRecord::Migration[5.1]
  def change
    create_table :carriers do |t|
      t.string :code
      t.string :name

      t.timestamps
    end

    add_index :carriers, :code
  end
end

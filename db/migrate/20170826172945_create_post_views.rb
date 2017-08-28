class CreatePostViews < ActiveRecord::Migration[5.1]
  def change
    create_table :post_views do |t|
      t.integer :post_id, null: false
      t.string :browser, null: false
      t.string :operating_system, null: false
      t.string :location, null: false

      t.timestamps
    end

    add_index :post_views, :post_id
    add_index :post_views, :browser
    add_index :post_views, :operating_system
    add_index :post_views, :location
  end
end

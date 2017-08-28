class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.integer :author_id, null: false
      t.string :title
      t.string :status, default: 'draft', null: false
      t.datetime :published_at
      t.boolean :is_featured, default: false, null: false
      t.integer :views_count, default: 0, null: false

      t.timestamps
    end

    add_index :posts, :author_id
    add_index :posts, :status
    add_index :posts, :published_at
    add_index :posts, :is_featured
    add_index :posts, :views_count
  end
end

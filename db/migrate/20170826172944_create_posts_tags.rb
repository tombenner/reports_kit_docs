class CreatePostsTags < ActiveRecord::Migration[5.1]
  def change
    create_table :posts_tags do |t|
      t.integer :post_id, null: false
      t.integer :tag_id, null: false

      t.timestamps
    end

    add_index :posts_tags, [:post_id, :tag_id], unique: true
    add_index :posts_tags, :tag_id
  end
end

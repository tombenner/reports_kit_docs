class AddPosts < SeedMigration::Migration
  def up
    Faker::Config.random = Random.new(42)

    Author.all.each do |author|
      rand(0..200).times.each do
        status = Post::STATUSES.sample
        published_at = status == 'published' ? rand(0..90).days.ago : nil
        created_at = published_at ? published_at - rand(0.90).days : rand(0..180).days.ago
        Post.create!(
          author_id: author.id,
          title: Faker::Book.title,
          status: status,
          published_at: published_at,
          is_featured: rand(0..10) == 0,
          created_at: created_at
        )
      end
    end
  end

  def down
    Post.destroy_all
  end
end

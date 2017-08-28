class AddTags < SeedMigration::Migration
  def up
    Faker::Config.random = Random.new(42)

    tag_names = 10.times.map { Faker::Company.buzzword }.uniq
    tags = tag_names.map do |name|
      Tag.create!(name: name)
    end
    posts = Post.all
    posts_count = posts.length

    tags.each do |tag|
      tag.posts = rand(1..posts_count).times.map { posts.sample }.uniq
    end
  end

  def down
    Tag.destroy_all
  end
end

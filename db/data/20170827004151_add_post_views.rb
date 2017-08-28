class AddPostViews < SeedMigration::Migration
  def up
    Faker::Config.random = Random.new(42)

    Post.all.each do |post|
      post.post_views = rand(0..30).times.map do
        created_at = post.created_at + rand(0..90).days
        PostView.new(
          browser: PostView::BROWSERS.sample,
          operating_system: PostView::OPERATING_SYSTEMS.sample,
          location: Faker::Address.state,
          created_at: created_at
        )
      end
    end
  end

  def down
    PostView.destroy_all
  end
end

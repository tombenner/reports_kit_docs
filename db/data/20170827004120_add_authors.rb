class AddAuthors < SeedMigration::Migration
  def up
    Faker::Config.random = Random.new(42)

    10.times.each do
      Author.create!(name: Faker::Name.first_name)
    end
  end

  def down
    Author.destroy_all
  end
end

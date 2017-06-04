namespace :data_import do
  desc 'Import flight data from a CSV into the database'
  task import: :environment do
    puts 'Importing data...'
    DataImport::Import.new.perform
  end
end

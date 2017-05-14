require 'csv'

module DataImport
  class Import
    def perform
      CSV.read(Rails.root.join('data', 'flights.csv'), headers: true).each do |row|
        import_row(row)
      end
    end

    private

    def import_row(row)
      attributes = {
        flight_at: Date.parse(row['FL_DATE']),
        carrier_key: row['UNIQUE_CARRIER']
      }
      Flight.where(attributes).first_or_create!
    end
  end
end

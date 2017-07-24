require 'csv'

module DataImport
  class Import
    MAX_FLIGHTS = 20_000

    def perform
      CSV.read(Rails.root.join('data', 'airlines.csv'), headers: true).each { |row| import_airline(row) }
      CSV.read(Rails.root.join('data', 'markets.csv'), headers: true).each { |row| import_market(row) }
      CSV.read(Rails.root.join('data', 'airports.csv'), headers: true).each { |row| import_airport(row) }
      CSV.read(Rails.root.join('data', 'carriers.csv'), headers: true).each { |row| import_carrier(row) }
      CSV.read(Rails.root.join('data', 'flights.csv'), headers: true).each_with_index do |row, index|
        return if index > MAX_FLIGHTS
        import_flight(row)
      end
    end

    private

    def import_airline(row)
      attributes = {
        code: row['Code'],
        name: row['Description'].split(': ').first
      }
      Airline.where(attributes).first_or_create!
    end

    def import_airport(row)
      attributes = {
        code: row['Code'],
        name: row['Description'].split(': ').last
      }
      market_id = airport_name_to_market_id(attributes[:name])
      attributes[:market_id] = market_id if market_id
      Airport.where(attributes.slice(:code, :name)).first_or_create!(attributes.slice(:market_id))
    end

    def import_carrier(row)
      attributes = {
        code: row['Code'],
        name: row['Description']
      }
      Carrier.where(attributes).first_or_create!
    end

    def import_market(row)
      attributes = {
        code: row['Code'],
        name: row['Description']
      }
      Market.where(attributes).first_or_create!
    end

    def import_flight(row)
      attributes = {
        flight_at: flight_at(row),
        carrier_id: Carrier.find_by!(code: row['CARRIER']).id,
        number: row['FL_NUM'],
        origin_airport_id: Airport.find_by!(code: row['ORIGIN_AIRPORT_ID']).id,
        origin_market_id: Market.find_by!(code: row['ORIGIN_CITY_MARKET_ID']).id,
        destination_airport_id: Airport.find_by!(code: row['DEST_AIRPORT_ID']).id,
        destination_market_id: Market.find_by!(code: row['DEST_CITY_MARKET_ID']).id,
        delay: row['ARR_DELAY']
      }
      Flight.where(attributes).first_or_create!
    rescue => e
      binding.pry
    end

    def flight_at(row)
      date = Date.parse(row['FL_DATE'])
      md5 = Digest::MD5.hexdigest(row['FL_NUM'])
      month_offset = md5[0].to_i(16)
      day_offset = md5[1].to_i(16) + md5[2].to_i(16)
      date - month_offset.months - day_offset.days
    end

    def airport_name_to_market_id(name)
      first_word = name.split(' ').first
      Market.where('name ILIKE ?', "#{first_word}%").first.try(:id)
    end
  end
end

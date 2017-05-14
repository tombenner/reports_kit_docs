class Flight < ApplicationRecord
  belongs_to :carrier
  belongs_to :origin_airport, class_name: 'Airport'
  belongs_to :origin_market, class_name: 'Market'
  belongs_to :destination_airport, class_name: 'Airport'
  belongs_to :destination_market, class_name: 'Market'
end

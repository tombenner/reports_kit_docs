class Flight < ApplicationRecord
  include ReportsKit::Model

  belongs_to :carrier
  belongs_to :origin_airport, class_name: 'Airport'
  belongs_to :origin_market, class_name: 'Market'
  belongs_to :destination_airport, class_name: 'Airport'
  belongs_to :destination_market, class_name: 'Market'

  reports_kit do
    dimension :hours_delayed, group: 'GREATEST(ROUND(flights.delay::float/60), 0)'
    filter :carrier_name, :string, column: 'carriers.name', joins: :carrier
    filter :is_on_time, :boolean, conditions: 'flights.delay <= 15'
  end
end

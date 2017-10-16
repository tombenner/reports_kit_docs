class Carrier < ApplicationRecord
  include ReportsKit::Model

  has_many :flights

  scope :top, -> {
    joins(:flights)
    .group('carriers.id')
    .order('COUNT(flights.carrier_id) DESC')
    .limit(30)
  }

  def to_s
    name
  end
end

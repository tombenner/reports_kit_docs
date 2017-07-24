class Airport < ApplicationRecord
  belongs_to :market, optional: true

  def to_s
    name
  end
end

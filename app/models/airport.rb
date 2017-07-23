class Airport < ApplicationRecord
  belongs_to :market

  def to_s
    name
  end
end

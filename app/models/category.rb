class Category < ActiveHash::Base
  self.data = [
    { key: 'bar_charts', name: 'Bar Charts' },
    { key: 'line_charts', name: 'Line Charts' },
    { key: 'other_charts', name: 'Other Charts' },
    { key: 'legends', name: 'Legends' },
    { key: 'measures', name: 'Measures' },
    { key: 'filters', name: 'Filters' },
    { key: 'dimensions', name: 'Dimensions' }
  ]

  def examples
    Example.where(category_key: key)
  end

  def to_param
    key
  end

  def to_s
    name
  end
end
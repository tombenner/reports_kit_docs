class Subcategory < ActiveHash::Base
  self.data = [
    # Getting Started
    { key: 'installation', name: 'Installation', category_key: 'getting_started' },
    { key: 'quick_start', name: 'Quick Start', category_key: 'getting_started' },
    { key: 'how_it_works', name: 'How It Works', category_key: 'getting_started' },
    # Data
    { key: 'measures', name: 'Measures', category_key: 'data' },
    { key: 'dimensions', name: 'Dimensions', category_key: 'data' },
    { key: 'filters', name: 'Filters', category_key: 'data' },
    # Visualization
    { key: 'bar_charts', name: 'Bar Charts', category_key: 'visualization' },
    { key: 'line_charts', name: 'Line Charts', category_key: 'visualization' },
    { key: 'other_charts', name: 'Other Charts', category_key: 'visualization' },
    { key: 'tables', name: 'Tables', category_key: 'visualization' },
    { key: 'legends', name: 'Legends', category_key: 'visualization' },
    # Interaction
    { key: 'interaction_filters', name: 'Filters', category_key: 'interaction' },
    { key: 'actions', name: 'Actions', category_key: 'interaction' },
    # Configuration
    { key: 'caching', name: 'Caching', category_key: 'configuration' },
    { key: 'concurrent_queries', name: 'Concurrent Queries', category_key: 'configuration' },
    { key: 'first_day_of_the_week', name: 'First Day of the Week', category_key: 'configuration' },
  ]

  def category
    Category.find_by(key: category_key)
  end

  def examples
    @examples ||= Example.where(subcategory_key: key)
  end

  def show_examples_in_nav?
    examples.length > 1
  end

  def to_param
    key
  end

  def to_s
    name
  end
end
class Example < ActiveHash::Base
  field :has_report, default: true
  field :has_text, default: false
  field :model_filename, default: 'post'

  self.data = [
    # Getting Started
    {
      subcategory_key: 'installation',
      key: 'installation',
      name: 'Installation',
      has_text: true,
      has_report: false
    },
    {
      subcategory_key: 'quick_start',
      key: 'quick_start',
      name: 'Quick Start',
      has_text: true,
      has_report: false
    },
    {
      subcategory_key: 'how_it_works',
      key: 'how_it_works',
      name: 'How It Works',
      has_text: true,
      has_report: false
    },
    # Data
    {
      subcategory_key: 'measures',
      key: 'measures_one',
      name: 'One Measure',
      has_text: true
    },
    {
      subcategory_key: 'measures',
      key: 'measures_multiple',
      name: 'Multiple Measures',
    },
    {
      subcategory_key: 'measures',
      key: 'measures_multiple_with_filters',
      name: 'Multiple Measures with Filters',
      view: <<-EOF
.pull-right
  = f.date_range :created_at
= f.multi_autocomplete :author, placeholder: 'Author...'
EOF
    },
    {
      subcategory_key: 'measures',
      key: 'measures_multiple_with_multiple_models',
      name: 'Multiple Measures with Multiple Models'
    },
    {
      subcategory_key: 'measures',
      key: 'measures_composite',
      name: 'Composite Measure'
    },
    {
      subcategory_key: 'measures',
      key: 'measures_custom_aggregation',
      name: 'Custom Aggregation'
    },
    {
      subcategory_key: 'filters',
      key: 'filter_boolean',
      name: 'Boolean'
    },
    {
      subcategory_key: 'filters',
      key: 'filter_datetime',
      name: 'Datetime',
      view: <<-EOF
.pull-right
  = f.date_range :created_at
EOF
    },
    {
      subcategory_key: 'filters',
      key: 'filter_number',
      name: 'Number'
    },
    {
      subcategory_key: 'filters',
      key: 'filter_string',
      name: 'String'
    },
    {
      subcategory_key: 'dimensions',
      key: 'dimension_association',
      name: 'Association'
    },
    {
      subcategory_key: 'dimensions',
      key: 'dimension_boolean',
      name: 'Boolean Column'
    },
    {
      subcategory_key: 'dimensions',
      key: 'dimension_datetime',
      name: 'Datetime Column'
    },
    {
      subcategory_key: 'dimensions',
      key: 'dimension_integer',
      name: 'Integer Column'
    },
    {
      subcategory_key: 'dimensions',
      key: 'dimension_string',
      name: 'String Column'
    },
    {
      subcategory_key: 'dimensions',
      key: 'dimension_two_dimensions',
      name: 'Two Dimensions'
    },
    {
      subcategory_key: 'dimensions',
      key: 'dimension_custom_dimension',
      name: 'Custom Dimension',
    },
    # Visualization
    {
      subcategory_key: 'bar_charts',
      key: 'bar',
      name: 'Basic'
    },
    {
      subcategory_key: 'bar_charts',
      key: 'bar_grouped',
      name: 'Grouped'
    },
    {
      subcategory_key: 'bar_charts',
      key: 'bar_stacked',
      name: 'Stacked'
    },
    {
      subcategory_key: 'bar_charts',
      key: 'bar_horizontal',
      name: 'Horizontal'
    },
    {
      subcategory_key: 'bar_charts',
      key: 'bar_horizontal_stacked',
      name: 'Horizontal Stacked'
    },
    {
      subcategory_key: 'line_charts',
      key: 'line',
      name: 'Basic'
    },
    {
      subcategory_key: 'line_charts',
      key: 'line_dashed',
      name: 'Dashed Line'
    },
    {
      subcategory_key: 'line_charts',
      key: 'line_stepped',
      name: 'Stepped Line'
    },
    {
      subcategory_key: 'line_charts',
      key: 'line_linear',
      name: 'Linear Interpolation'
    },
    {
      subcategory_key: 'other_charts',
      key: 'area',
      name: 'Area'
    },
    {
      subcategory_key: 'other_charts',
      key: 'pie',
      name: 'Pie'
    },
    {
      subcategory_key: 'other_charts',
      key: 'radar',
      name: 'Radar'
    },
    {
      subcategory_key: 'tables',
      key: 'table',
      name: 'Table',
      view: <<-EOF
.pull-right
  = f.date_range :created_at
= f.multi_autocomplete :author, placeholder: 'Author...'
EOF
    },
    {
      subcategory_key: 'tables',
      key: 'table_with_aggregations',
      name: 'Table with Aggregations',
      view: <<-EOF
.pull-right
  = f.date_range :created_at
= f.multi_autocomplete :author, placeholder: 'Author...'
EOF
    },
    {
      subcategory_key: 'legends',
      key: 'legend_top',
      name: 'Top'
    },
    {
      subcategory_key: 'legends',
      key: 'legend_left',
      name: 'Left'
    },
    {
      subcategory_key: 'legends',
      key: 'legend_right',
      name: 'Right'
    },
    {
      subcategory_key: 'legends',
      key: 'legend_bottom',
      name: 'Bottom'
    },
    {
      subcategory_key: 'legends',
      key: 'legend_none',
      name: 'None'
    },
    # Interaction
    {
      subcategory_key: 'interaction_filters',
      key: 'interaction_multiple_filters',
      name: 'Multiple Filters',
      view: <<-EOF
.pull-right
  = f.date_range :created_at
= f.multi_autocomplete :author, placeholder: 'Author...'
= f.string_filter :title, placeholder: 'Title (e.g. The)...', style: 'width: 175px;'
.checkbox
  = label_tag :is_featured do
    = f.check_box :is_featured
    Featured
EOF
    },
    {
      subcategory_key: 'interaction_filters',
      key: 'interaction_filter_check_box',
      name: 'Check Box',
      view: <<-EOF
.checkbox
  = label_tag :is_featured do
    = f.check_box :is_featured
    Featured
EOF
    },
    {
      subcategory_key: 'interaction_filters',
      key: 'interaction_filter_date_range',
      name: 'Date Range',
      view: <<-EOF
= f.date_range :created_at
EOF
    },
    {
      subcategory_key: 'interaction_filters',
      key: 'interaction_filter_multi_autocomplete',
      name: 'Multi-Autocomplete',
      view: <<-EOF
= f.multi_autocomplete :author, placeholder: 'Author...'
EOF
    },
    {
      subcategory_key: 'interaction_filters',
      key: 'interaction_filter_string',
      name: 'String',
      view: <<-EOF
= f.string_filter :title, placeholder: 'Title (e.g. The)...', style: 'width: 175px;'
EOF
    },
    {
      subcategory_key: 'actions',
      key: 'actions',
      name: 'Actions',
      has_report: false,
      has_text: true
    },
    # Configuration
    {
      subcategory_key: 'caching',
      key: 'caching',
      name: 'Caching',
      has_report: false,
      has_text: true
    },
    {
      subcategory_key: 'concurrent_queries',
      key: 'concurrent_queries',
      name: 'Concurrent Queries',
      has_report: false,
      has_text: true
    },
    {
      subcategory_key: 'first_day_of_the_week',
      key: 'first_day_of_the_week',
      name: 'First Day of the Week',
      has_report: false,
      has_text: true
    },
  ]

  def file
    [category.key, subcategory.key, key].join('/')
  end

  def display_yaml_path
    "config/reports_kit/reports/#{key}.yml"
  end

  def markdown_text
    path = Rails.root.join('app', 'views', 'examples', 'texts', category.key, subcategory.key, "#{key}.md")
    File.read(path)
  end

  def subcategory
    Subcategory.find_by(key: subcategory_key)
  end

  def category
    subcategory.category
  end

  def config
    # @config ||= begin
      return unless file
      YAML.load_file(Rails.root.join('config', 'reports_kit', 'reports', "#{file}.yml"))
    # end
  end

  def to_param
    key
  end

  def to_s
    name
  end
end
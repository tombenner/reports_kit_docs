class Example < ActiveHash::Base
  self.data = [
    {
      category_key: 'bar_charts',
      key: 'bar',
      name: 'Basic'
    },
    {
      category_key: 'bar_charts',
      key: 'bar_grouped',
      name: 'Grouped'
    },
    {
      category_key: 'bar_charts',
      key: 'bar_stacked',
      name: 'Stacked'
    },
    {
      category_key: 'bar_charts',
      key: 'bar_horizontal',
      name: 'Horizontal'
    },
    {
      category_key: 'bar_charts',
      key: 'bar_horizontal_stacked',
      name: 'Horizontal Stacked'
    },
    {
      category_key: 'line_charts',
      key: 'line',
      name: 'Basic'
    },
    {
      category_key: 'line_charts',
      key: 'line_dashed',
      name: 'Dashed Line'
    },
    {
      category_key: 'line_charts',
      key: 'line_stepped',
      name: 'Stepped Line'
    },
    {
      category_key: 'line_charts',
      key: 'line_linear',
      name: 'Linear Interpolation'
    },
    {
      category_key: 'other_charts',
      key: 'area',
      name: 'Area'
    },
    {
      category_key: 'other_charts',
      key: 'radar',
      name: 'Radar'
    },
    {
      category_key: 'tables',
      key: 'table',
      name: 'Table',
      view: <<-EOF
.pull-right
  = f.date_range :flight_at
= f.multi_autocomplete :carrier, scope: 'top', placeholder: 'Carrier...'
EOF
    },
    {
      category_key: 'legends',
      key: 'legend_top',
      name: 'Top'
    },
    {
      category_key: 'legends',
      key: 'legend_left',
      name: 'Left'
    },
    {
      category_key: 'legends',
      key: 'legend_right',
      name: 'Right'
    },
    {
      category_key: 'legends',
      key: 'legend_bottom',
      name: 'Bottom'
    },
    {
      category_key: 'legends',
      key: 'legend_none',
      name: 'None'
    },
    {
      category_key: 'measures',
      key: 'measures_one',
      name: 'One Measure'
    },
    {
      category_key: 'measures',
      key: 'measures_multiple',
      name: 'Multiple Measures',
    },
    {
      category_key: 'measures',
      key: 'measures_multiple_with_filters',
      name: 'Multiple Measures with Filters',
      view: <<-EOF
.pull-right
  = f.date_range :flight_at
= f.multi_autocomplete :carrier, scope: 'top', placeholder: 'Carrier...'
EOF
    },
    {
      category_key: 'measures',
      key: 'measures_multiple_with_multiple_models',
      name: 'Multiple Measures with Multiple Models',
      view: <<-EOF
= f.multi_autocomplete :market, scope: 'top', placeholder: 'Market...'
EOF
    },
    {
      category_key: 'filters',
      key: 'filters',
      name: 'All',
      view: <<-EOF
.pull-right
  = f.date_range :flight_at
= f.multi_autocomplete :carrier, scope: 'top', placeholder: 'Carrier...'
= f.string_filter :carrier_name, placeholder: 'Carrier name (e.g. Airlines)...', style: 'width: 175px;'
.checkbox
  = label_tag :is_on_time do
    = f.check_box :is_on_time
    On time
EOF
    },
    {
      category_key: 'filters',
      key: 'filter_check_box',
      name: 'Check Box',
      view: <<-EOF
.checkbox
  = label_tag :is_on_time do
    = f.check_box :is_on_time
    On time
EOF
    },
    {
      category_key: 'filters',
      key: 'filter_date_range',
      name: 'Date Range',
      view: <<-EOF
= f.date_range :flight_at
EOF
    },
    {
      category_key: 'filters',
      key: 'filter_multi_autocomplete',
      name: 'Multi-Autocomplete',
      view: <<-EOF
= f.multi_autocomplete :carrier, scope: 'top', placeholder: 'Carrier...'
EOF
    },
    {
      category_key: 'filters',
      key: 'filter_string',
      name: 'String',
      view: <<-EOF
= f.string_filter :carrier_name, placeholder: 'Carrier name (e.g. Airlines)...', style: 'width: 175px;'
EOF
    },
    {
      category_key: 'filters',
      key: 'filter_configured_boolean',
      name: 'Configured Boolean'
    },
    {
      category_key: 'filters',
      key: 'filter_configured_datetime',
      name: 'Configured Datetime',
      view: <<-EOF
.pull-right
  = f.date_range :flight_at
EOF
    },
    {
      category_key: 'filters',
      key: 'filter_configured_number',
      name: 'Configured Number'
    },
    {
      category_key: 'filters',
      key: 'filter_configured_string',
      name: 'Configured String'
    },
    {
      category_key: 'dimensions',
      key: 'dimension_association',
      name: 'Association'
    },
    {
      category_key: 'dimensions',
      key: 'dimension_datetime',
      name: 'Datetime Column'
    },
    {
      category_key: 'dimensions',
      key: 'dimension_integer',
      name: 'Integer Column'
    },
    {
      category_key: 'dimensions',
      key: 'dimension_two_dimensions',
      name: 'Two Dimensions'
    },
    {
      category_key: 'dimensions',
      key: 'dimension_custom_dimension',
      name: 'Custom Dimension',
    }
  ]

  def file
    key
  end

  def config
    @config ||= begin
      return unless file
      YAML.load_file(Rails.root.join('config', 'reports_kit', 'reports', "#{file}.yml"))
    end
  end

  def to_param
    key
  end

  def to_s
    name
  end

  def category
    Category.find_by(key: category_key)
  end
end
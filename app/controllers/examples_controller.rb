class ExamplesController < ApplicationController
  EXAMPLES = [
    {
      category: 'Bar Charts',
      name: 'Basic',
      file: 'bar',
    },
    {
      category: 'Bar Charts',
      name: 'Grouped',
      file: 'bar_grouped'
    },
    {
      category: 'Bar Charts',
      name: 'Stacked',
      file: 'bar_stacked'
    },
    {
      category: 'Bar Charts',
      name: 'Horizontal',
      file: 'bar_horizontal'
    },
    {
      category: 'Bar Charts',
      name: 'Horizontal Stacked',
      file: 'bar_horizontal_stacked'
    },
    {
      category: 'Line Charts',
      name: 'Basic',
      file: 'line'
    },
    {
      category: 'Line Charts',
      name: 'Dashed Line',
      file: 'line_dashed'
    },
    {
      category: 'Line Charts',
      name: 'Stepped Line',
      file: 'line_stepped'
    },
    {
      category: 'Line Charts',
      name: 'Linear Interpolation',
      file: 'line_linear'
    },
    {
      category: 'Other Charts',
      name: 'Area',
      file: 'area'
    },
    {
      category: 'Other Charts',
      name: 'Radar',
      file: 'radar'
    },
    {
      category: 'Legends',
      name: 'Top',
      file: 'legend_top'
    },
    {
      category: 'Legends',
      name: 'Left',
      file: 'legend_left'
    },
    {
      category: 'Legends',
      name: 'Right',
      file: 'legend_right'
    },
    {
      category: 'Legends',
      name: 'Bottom',
      file: 'legend_bottom'
    },
    {
      category: 'Legends',
      name: 'None',
      file: 'legend_none'
    },
    {
      category: 'Filters',
      name: 'All',
      file: 'filters',
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
      category: 'Filters',
      name: 'Check Box',
      file: 'filter_check_box',
      view: <<-EOF
.checkbox
  = label_tag :is_on_time do
    = f.check_box :is_on_time
    On time
EOF
    },
    {
      category: 'Filters',
      name: 'Date Range',
      file: 'filter_date_range',
      view: <<-EOF
= f.date_range :flight_at
EOF
    },
    {
      category: 'Filters',
      name: 'Multi-Autocomplete',
      file: 'filter_multi_autocomplete',
      view: <<-EOF
= f.multi_autocomplete :carrier, scope: 'top', placeholder: 'Carrier...'
EOF
    },
    {
      category: 'Filters',
      name: 'String',
      file: 'filter_string',
      view: <<-EOF
= f.string_filter :carrier_name, placeholder: 'Carrier name (e.g. Airlines)...', style: 'width: 175px;'
EOF
    },
    {
      category: 'Filters',
      name: 'Configured Boolean',
      file: 'filter_configured_boolean'
    },
    {
      category: 'Filters',
      name: 'Configured Datetime',
      file: 'filter_configured_datetime'
    },
    {
      category: 'Filters',
      name: 'Configured Number',
      file: 'filter_configured_number'
    },
    {
      category: 'Filters',
      name: 'Configured String',
      file: 'filter_configured_string'
    },
    {
      category: 'Dimensions',
      name: 'Association',
      file: 'dimension_association'
    },
    {
      category: 'Dimensions',
      name: 'Datetime Column',
      file: 'dimension_datetime'
    },
    {
      category: 'Dimensions',
      name: 'Integer Column',
      file: 'dimension_integer'
    },
    {
      category: 'Dimensions',
      name: 'Two Dimensions',
      file: 'dimension_two_dimensions'
    },
    {
      category: 'Dimensions',
      name: 'Custom Dimension',
      file: 'dimension_custom_dimension'
    }
  ]

  def index
    first_key = examples.first.key
    redirect_to example_path(first_key)
  end

  def show
    @key = params[:key].presence || examples.first[:key]
    @examples = examples
    @example = examples.find { |example| example.key == @key }
    @page_title = "#{@example.category} | #{@example.name}"
    @yaml_path = "config/reports_kit/reports/#{@example.file}.yml"
    properties = YAML.load_file(@yaml_path)
    @measure = ReportsKit::Reports::Measure.new(properties['measure'])
    render text: 'Not found', status: 404 if @example.blank?
  end

  private

  def examples
    EXAMPLES.map do |example|
      example[:key] = example[:file].gsub(' ', '_').underscore
      file = example[:file]
      if file
        example[:config] = YAML.load_file(Rails.root.join('config', 'reports_kit', 'reports', "#{file}.yml"))
      end
      OpenStruct.new(example)
    end
  end
end

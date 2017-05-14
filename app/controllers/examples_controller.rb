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
      category: 'Filters',
      name: 'All',
      file: 'filters',
      view: <<-EOF
= f.multi_autocomplete :carrier, scope: 'top', placeholder: 'Carrier...'
= f.string_filter :number, placeholder: 'Flight number (e.g. 123)...', style: 'width: 160px;'
= f.date_range :flight_at
EOF
    },
  ]

  def index
    first_key = examples.first.key
    redirect_to example_path(first_key)
  end

  def show
    @key = params[:key].presence || examples.first[:key]
    @examples = examples
    @example = examples.find { |example| example.key == @key }
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

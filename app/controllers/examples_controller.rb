class ExamplesController < ApplicationController
  def show
    @key = params[:key].presence || examples.first[:key]
    @example = Example.find_by(key: @key)
    if @example.blank?
      render text: 'Not found', status: 404
      return
    end
    @category = @example.category
    @examples = @category.examples
    @page_title = "#{@example.category} | #{@example.name}"
    @yaml_path = "config/reports_kit/reports/#{@example.file}.yml"
    properties = YAML.load_file(@yaml_path)
    @measure = ReportsKit::Reports::Measure.new(properties['measure'] || properties['measures'].first)
  end
end

class ExamplesController < ApplicationController
  EXAMPLES = [
    {
      category: 'Charts',
      name: 'Bar',
      subtitle: 'Flights by date',
      file: 'bar'
    }
  ].freeze

  def show
    @key = params[:key].presence || examples.first[:key]
    @examples = examples
    @example = examples.find { |example| example.key == @key }
    render text: 'Not found', status: 404 if @example.blank?
  end

  private

  def examples
    @examples ||= EXAMPLES.map do |example|
      example[:key] = example[:name].gsub(' ', '_').underscore
      file = example[:file]
      if file
        example[:config] = YAML.load_file(Rails.root.join('config', 'reports_kit', 'reports', "#{file}.yml"))
      end
      OpenStruct.new(example)
    end
  end
end

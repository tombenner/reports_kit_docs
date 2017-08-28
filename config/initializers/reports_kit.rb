ReportsKit.configure do |config|
  DEFAULT_SMALL_PROPERTIES = {
    chart: {
      options: {
        legend: {
          display: false
        },
        scales: {
          xAxes: [
            {
              display: false
            }
          ],
          yAxes: [
            {
              display: false
            }
          ]
        }
      }
    }
  }.freeze

  config.properties_method = lambda do |env|
    path = Rails.root.join('config', 'reports_kit', 'reports', "#{report_key}.yml")
    properties = YAML.safe_load(File.read(path))
    properties = properties.deep_merge(DEFAULT_SMALL_PROPERTIES) if params[:report_params][:is_small]
    properties
  end
end

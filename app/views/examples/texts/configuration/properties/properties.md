When you call `render_report 'my_report_key'`, ReportsKit reads the report properties by executing `YAML.load_file("config/reports_kit/reports/#{report_key}.yml")` and then uses those properties to generate the data for the report.

If you want to modify the logic that reads the properties, you can do so by defining `config.properties_method`. This lambda is evaluated in the context of the controller action that renders the report data, so any methods available to that controller can be used in this lambda.

For example, if you want to store your YAML files in `"config/my_reports/#{report_key}.yml"` and only show a maximum of 30 results for non-admin users, you would do so like this:

```ruby
# config/initializers/reports_kit.rb

ReportsKit.configure do |config|
  config.properties_method = lambda do |controller|
    path = Rails.root.join('config', 'my_reports', "#{report_key}.yml")
    properties = YAML.load_file(path)
    properties['limit'] = 30 unless current_user.admin?
    properties
  end
end
```

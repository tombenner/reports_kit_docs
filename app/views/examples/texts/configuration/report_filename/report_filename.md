ReportsKit shows 'Download CSV' and 'Download Excel' buttons for each report by default, and the downloaded file's filename will either be `Report.csv` or `Report.xls`.

If you need to customize the filename, you can do so by using `config.report_filename_method`. This lambda is evaluated in the context of the controller action that renders the file, so any methods available to that controller can be used in this lambda.

```ruby
# config/initializers/reports_kit.rb

ReportsKit.configure do |config|
  config.report_filename_method = lambda do |controller|
    report_key = params[:report_params][:key]
    name = report_key == 'posts_by_author' ? 'Posts by Author' : 'Report'
    name += " for #{context_record}" if context_record
    name
  end
end
```

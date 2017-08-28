ReportsKit typically only executes one SQL query per report, but if a report has multiple measures, ReportsKit may make multiple SQL queries. By default, these queries are performed sequentially, but their performance can be improved by running them concurrently. To enable this functionality, set `config.use_concurrent_queries = true`.

```ruby
# config/initializers/reports_kit.rb

ReportsKit.configure do |config|
  config.use_concurrent_queries = true
end
```

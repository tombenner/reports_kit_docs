To enable caching of the response data of each report, set `config.cache_store`. The data will be cached for a duration of `config.cache_duration`, which defaults to `5.minutes`.

Redis is currently the only supported store, but other stores may be added in the future.

```ruby
# config/initializers/reports_kit.rb

ReportsKit.configure do |config|
  config.cache_store = Redis.new(url: "redis://:password@10.0.1.1:6380/15")
  config.cache_duration = 10.minutes
end
```

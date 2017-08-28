By default, when ReportsKit groups data by week, it uses Sunday as the first day of the week. However, in some cases, Monday is the preferred first day of the week. The default first day of the week can be modified to be any day using `config.first_day_of_week`.

```ruby
# config/initializers/reports_kit.rb

ReportsKit.configure do |config|
  config.first_day_of_week = :monday
end
```

A datetime filter lets you filter the report by either a datetime column or by some custom expression that evaluates to a datetime.

### Datetime Column

If the model has a datetime `created_at` column, you can use the following to only count records which were created in the last three months:

```yaml
measure: post
filters:
- key: created_at
  criteria:
    operator: between
    value: -3M - now
dimensions:
- author
```

You'll typically want to use relative time for the filter, so ReportsKit provides simple abbreviations for time units. For example, `-3w` is converted to `3.weeks.ago`.

```
y - years
M - months
w - weeks
d - days
h - hours
m - minutes
s - seconds
```

### Custom Filter

To use a custom SQL expression instead of a column, define it in the model:

```ruby
class Post < ApplicationRecord
  include ReportsKit::Model
  reports_kit do
    filter :author_created_at, :datetime, joins: :author, column: 'authors.created_at'
  end
end
```

And then use it in the YAML:

```yaml
measure:
  key: post
  name: New Authors' Posts
filters:
- key: author_created_at
  criteria:
    operator: between
    value: -3M - now
dimensions:
- author
```

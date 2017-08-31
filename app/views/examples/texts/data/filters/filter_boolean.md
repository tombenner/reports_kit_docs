A boolean filter lets you filter the report by either a boolean column or by some SQL expression that evaluates to a boolean.

### Boolean Column

If the model has a boolean `is_featured` column, you can use the following to only count records which have a true value for that column:

```yaml
measure:
  key: post
  name: Featured Posts
filters:
- key: is_featured
  criteria:
    value: true
dimensions:
- author
```

### Custom Filter

To use a custom ActiveRecord condition or custom SQL expression instead of a column, define it in the model:

```ruby
class Post < ApplicationRecord
  include ReportsKit::Model
  reports_kit do
    filter :is_published, :boolean, conditions: ->(relation) { relation.where(status: 'published') }
  end
end
```

And then use it in the YAML:

```yaml
measure:
  key: post
  name: Published Posts
filters:
- key: is_published
  criteria:
    value: true
dimensions:
- author
```

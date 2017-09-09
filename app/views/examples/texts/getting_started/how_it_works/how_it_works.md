Let's say we have the following chart:

`config/reports_kit/reports/my_posts.yml`

```yaml
measure: post
dimensions:
- created_at
```


In this YAML, `measure: post` tells ReportsKit to count the number of `Post` records, and `dimensions: ['created_at']` tells it to group by the week of the `created_at` column. Since `created_at` is a `datetime` column, ReportsKit knows that it should group the counts by week (the granularity is configurable), sort them chronologically, and add in zeros for any missing weeks.

ReportsKit infers sensible defaults from your ActiveRecord model configurations. Since the `Post` model also has a `belongs_to :author` association, if you use `dimensions: ['author']`, then ReportsKit would count posts grouped by the `author_id` column and show author names on the x-axis.

If you need more customization (e.g. custom filters, custom dimensions, custom aggregation functions, custom orders, aggregations of aggregations, etc), ReportsKit is very flexible and powerful and supports all of these with a simple syntax. It lets you use SQL, too.

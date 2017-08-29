In the Quick Start chart, `measure: user` tells ReportsKit to count the number of `User` records, and `dimensions: ['created_at']` tells it to group by the week of the `created_at` column. Since `created_at` is a `datetime` column, ReportsKit knows that it should group the counts by week (the granularity is configurable), sort them chronologically, and add in zeros for any missing weeks.

ReportsKit infers sane defaults from your ActiveRecord model configurations. If there was a `belongs_to :company` association on `User` and you used `dimensions: ['company']`, then ReportsKit would count users grouped by the `company_id` column and show company names on the x-axis.

If you need more customization (e.g. custom filters, custom dimensions, custom aggregation functions, custom orders, aggregations of aggregations, etc), ReportsKit is very flexible and powerful and supports all of these with a simple syntax. It lets you use SQL, too.

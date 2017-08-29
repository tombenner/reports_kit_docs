To define the data of a report, create a YAML file at `config/reports_kit/reports/my_report.yml`. The YAML file should contain at least one measure and at least one dimension.

* *Measure* - The model that's being counted or aggregated in another way. This is the y-axis.
* *Dimension* - The column(s) or association(s) that you are grouping by. This is the x-axis.

As an example, the report below shows posts grouped by tag where the `posts.is_featured` column is true.

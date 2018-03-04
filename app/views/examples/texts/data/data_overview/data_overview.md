To define the data of a report, create a YAML file at `config/reports_kit/reports/my_report.yml`.

You can define how the data is generated using one of two strategies:

### Measures and Dimensions

By using measures and dimensions, you can define how the data is generated in the YAML file. The YAML should define at least one measure and at least one dimension.

* *Measure* - The model that's being counted or aggregated in another way. This is the y-axis.
* *Dimension* - The column(s) or association(s) that you are grouping by. This is the x-axis.

For examples, see [Measures](/subcategories/measures), [Dimensions](/subcategories/dimensions), and [Filters](/subcategories/filters).

### Data Method

Instead of defining measures and dimensions in the YAML, you can alternatively using a `data_method` to use any Ruby logic to generate the data.

For examples, see [Data Methods](/subcategories/data_methods).

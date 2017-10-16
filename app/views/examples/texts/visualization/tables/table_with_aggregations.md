If you'd like to add rows or columns that aggregate the table's data, you can use `report_options.aggregations`. Currently, the only supported operator is `sum`, but others may be supported in the future.

For example, if you want to add a row at the bottom of a table that shows the sum of each column and a column at the end of the table that shows the sum of each row, use the following:

```yaml
report_options:
  aggregations:
    - from: columns
      operator: sum
      label: Total
    - from: rows
      operator: sum
      label: Total
```

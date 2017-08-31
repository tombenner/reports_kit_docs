To order the results of a report, use the `order` option. Similar to SQL, this accepts values like `1`, `1 asc`, or `1 desc` to order by the first column ascending or descending. If multiple series are used, you can use `2 desc` to order by the second series descending, for example.

You can also order by properties of a dimension. For example, if the first dimension is `tags` and you want to sort by tag names ascending, you can use `dimension1.label asc`.

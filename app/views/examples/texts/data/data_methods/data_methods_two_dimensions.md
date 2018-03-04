When using a `data_method` that returns data with two dimensions (i.e. multiple series of data), the `data_method` can return the data in one of two formats:

### Hash

```ruby
{
  ['Jul 3, 2016', 'Hilton'] => 2,
  ['Jul 10, 2016', 'Hilton'] => 2,
  ['Jul 3, 2016', 'Carlee'] => 3,
  ['Jul 10, 2016', 'Carlee'] => 5
]
```

### Array

```ruby
[
  [['Jul 3, 2016', 'Hilton'], 2],
  [['Jul 10, 2016', 'Hilton'], 2],
  [['Jul 3, 2016', 'Carlee'], 3],
  [['Jul 10, 2016', 'Carlee'], 5]
]
```

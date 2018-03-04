When generating data for a report, the common approach is to specify measures and dimensions in the YAML file, but if you want to use any Ruby logic to generate the data, you can do so with a `data_method`.

To use a `data_method`, create a class method that takes `properties` as an argument and returns the data for the report:

```ruby
# app/services/my_data_methods.rb

class MyDataMethods
  # { 'Bernice' => 191, 'Carlee' => 160, 'Edison' => 60, ... }
  def self.posts_by_author(properties)
    Post.joins(:author).group('authors.name').order('authors.name').count
  end
end
```

Then set `data_method` to that class method in the report's YAML file:

```yaml
data_method: MyDataMethods.posts_by_author
chart:
  options:
    legend:
      display: false
    scales:
      xAxes:
      - scaleLabel:
          display: true
          labelString: Posts
      yAxes:
      - scaleLabel:
          display: true
          labelString: Author
```

The `properties` argument is a hash that contains data from the report's YAML file, [form filter data](/examples/data_methods_form_filters), and [context_params](/examples/contextual_filters) that were passed to `render_report`.

To see examples of the format of the data that should be returned by a `data_method`, see [Data Methods > One Dimension](/examples/data_methods_one_dimension) and [Data Methods > Two Dimensions](/examples/data_methods_two_dimensions).

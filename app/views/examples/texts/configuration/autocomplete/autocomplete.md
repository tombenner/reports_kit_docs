The [multi-autocomplete form filter](/categories/interaction/subcategories/interaction_filters/examples/interaction_filter_multi_autocomplete) lets users easily filter by associated records. By default, it uses the model's `#to_s` method as the text of each result, but if you need to use custom filtering logic or show custom text, you can use `config.autocomplete_results_method`.

`config.autocomplete_results_method` accepts the following arguments:

* `params` - The params passed to the autocomplete endpoint. The user's query is in `params[:q]`.
* `context_record` - The context_record of the report. See [Context Record](categories/configuration/subcategories/context_record) for more.
* `relation` - The base ActiveRecord relation that ReportsKit uses for the autocomplete results. For example, if the autocomplete is `= f.multi_autocomplete :author`, then this will be equivalent to `Author.all`.

This lambda is evaluated in the context of the controller action that renders the autocomplete results, so any methods available to that controller can be used in this lambda.

You'll need to return an array of hashes with keys `:id` and `:text`:

```ruby
# config/initializers/reports_kit.rb

ReportsKit.configure do |config|
  config.autocomplete_results_method = lambda do |params:, context_record:, relation:|
    query = params[:q]
    results = relation.where('name ILIKE ?', "%#{query}%").order('name').limit(30)
    results.map do |result|
      {
        id: result.id,
        text: "#{result.last_name}, #{result.first_name}" }
      }
    end
  end
end
```

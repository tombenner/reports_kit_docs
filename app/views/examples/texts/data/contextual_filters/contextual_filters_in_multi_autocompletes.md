[Contextual filters](/examples/contextual_filters) can optionally be used in [multi-autocompletes](/examples/interaction_filter_multi_autocomplete). For example, if you have a multi-autocomplete that lists authors, and you'd like to only show a certain set of authors in the autocomplete's results, you can use a contextual filter to do this.

First, define a `for_author` contextual filter in the `Author` model:

```ruby
# app/models/author.rb

class Author < ApplicationRecord
  include ReportsKit::Model
  reports_kit do
    contextual_filter :for_author, ->(relation, context_params) { relation.where(id: context_params[:author_id]) }
  end
end
```

Then add the `for_author` contextual filter to the `author` filter in the YAML:

```yaml
measure: post
filters:
- key: author
  contextual_filters:
  - for_author
dimensions:
- created_at
```

Now, in the view, you can specify the `context_params` that will be passed to this contextual filter. If you wanted to, say, only show authors with names starting with the letters A-E, you could do the following:

```haml
= render_report 'my_report', context_params: { author_id: Author.where("name < 'F'").pluck(:id) } }
```

*N.B. The `context_params` will be passed from the client to the server when the report's data is generated. If you need to do server-side validation of them, you can do so using [context params validation](/examples/context_params_modification).*

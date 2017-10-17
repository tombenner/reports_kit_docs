To scope a report to a specific record (e.g. to show a report about a specific user), use a Contextual Filter.

For example, let's say that you want to create a report of the weekly Posts by a specific Author. You would add a `contextual_filter` to the Post model:

```ruby
# app/models/post.rb

class Post < ApplicationRecord
  include ReportsKit::Model
  reports_kit do
    contextual_filter :for_author, ->(relation, context_params) { relation.where(author_id: context_params[:author_id]) }
  end
end
```

Then specify that `contextual_filter` in the YAML:

```yaml
measure: post
contextual_filters:
- for_author
dimensions:
- created_at
```

And set the `context_params` that will be passed to it in the view:

```haml
= render_report 'my_report', context_params: { author_id: current_user.id }
```

*N.B. The `context_params` will be passed from the client to the server when the report's data is generated. If you need to do server-side validation of them, you can do so using [context params validation](/examples/context_params_modification).*

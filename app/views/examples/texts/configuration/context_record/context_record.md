Configuring a context record allows you to scope a report to only include data associated with a single ActiveRecord object.

For example, let's say that we have a `Blog` model that `has_many :posts`, and on each `blogs#show` view, we want to show a chart of the number of posts by author for that blog.

```ruby
class Blog < ApplicationRecord
  has_many :posts
end
```

A report that counts `Post`s by author would look like this:

```yaml
measure: post
dimensions:
- author
```

But it would count all posts, and not be scoped to a particular `Blog`. It would perform a query similar to `Post.group(:author_id).count`, but we want `@blog.posts.group(:author_id).count`.

To do this, we would include the blog ID in `render_report`'s `context_params`:

```haml
# app/views/blogs/show.html.haml

= render_report 'my_posts', context_params: { blog_id: @blog.id }
```

And we would configure ReportsKit to set the appropriate context record when that parameter exists:

```ruby
# config/initializers/reports_kit.rb

ReportsKit.configure do |config|
  config.context_record_method = lambda do |controller|
    context_params = controller.params[:context_params]
    return unless context_params && context_params[:blog_id].present?
    Blog.find(context_params[:blog_id])
  end
end
```

The above method is called during the API request to generate the data for the report.

Now, the report in that view will essentially show `Blog.find(context_params[:blog_id]).posts.group(:author_id).count`, as we wanted.

If we use the same report in another view and we don't pass `context_params` to `render_report`, then `context_record_method` will return `nil`, and the report will show the data for all posts (`Post.group(:author_id).count`), as it did before.

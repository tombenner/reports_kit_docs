If you're using a [Contextual Filter](/examples/contextual_filters), the `context_params` are sent by the client to the server, so you may want to validate them (or otherwise modify them) on the server. You can do this using the `modify_context_params_method`.

For example, the following will ensure that a user can only view data about users from their own organization:

```ruby
# config/initializers/reports_kit.rb

ReportsKit.configure do |config|
  config.modify_context_params_method = ->(context_params, env) {
    allowed_user_ids = env.current_user.organization.user_ids

    if allowed_user_ids.include?(context_params[:user_id])
      context_params
    else
      {}
    end
  }
end
```

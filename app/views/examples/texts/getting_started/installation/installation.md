In `Gemfile`:

```ruby
gem 'reports_kit'
```

In `app/assets/stylesheets/application.css.scss`:

```scss
*= require reports_kit/application
```

In `app/assets/javascripts/application.js`:

```js
//= require reports_kit/application
```

In `config/routes.rb`:

```ruby
Rails.application.routes.draw do
  mount ReportsKit::Engine, at: '/'
  # ...
end
```

To create your first report, use the [Quick Start](/categories/getting_started/subcategories/quick_start)!

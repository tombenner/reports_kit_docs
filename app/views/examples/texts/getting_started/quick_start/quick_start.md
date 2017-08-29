After installation, you can create your first chart with just a YAML file and a single line in any view.

Configure the chart in the YAML file:

`config/reports_kit/reports/my_users.yml`

```yaml
measure: user
dimensions:
- created_at
```

Then pass that filename to `render_report` in a view:

`app/views/users/index.html.haml`

```haml
= render_report 'my_users'
```

You're done! `render_report` will render the following chart:

[<img src="https://raw.githubusercontent.com/tombenner/reports_kit/master/docs/images/users_by_created_at.png?raw=true" width="500" />](https://raw.githubusercontent.com/tombenner/reports_kit/master/docs/images/users_by_created_at.png?raw=true)

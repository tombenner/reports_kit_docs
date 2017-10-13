ReportsKit Docs
===============

This is the Rails app that generates [reportskit.co](https://www.reportskit.co), which is the documentation for [ReportsKit](https://github.com/tombenner/reports_kit).

If you'd like to improve this documentation, feel free to open a PR!

Installation
------------

To set up the database locally, run the following:

```bash
rake db:setup
rake data_import:import
```

Then start the Rails app:

```bash
rails s
```

Contributing
------------

To help you contribute more easily, here are some navigational tips about this codebase:

* Each webpage corresponds to a [Category](https://github.com/tombenner/reports_kit_docs/blob/master/app/models/category.rb), [Subcategory](https://github.com/tombenner/reports_kit_docs/blob/master/app/models/subcategory.rb), or [Example](https://github.com/tombenner/reports_kit_docs/blob/master/app/models/example.rb).
* Each Example's content is created by either [a report YML file](https://github.com/tombenner/reports_kit_docs/tree/master/config/reports_kit/reports) or [a Markdown file](https://github.com/tombenner/reports_kit_docs/tree/master/app/views/examples/texts), or both.
* There is additional code in this repo that binds all of this together, but most of it doesn't need to be modified for most use cases. If you do want to modify it, you should be able to use your knowledge of Rails conventions to determine how the code is organized.

License
-------

ReportsKit is released under the MIT License. Please see the MIT-LICENSE file for details.

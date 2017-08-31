ReportsKit provides a number of easy, powerful form filters that are commonly needed to allow users to interactively filter reports. As shown below, when you call `render_report`, you can pass it a block and render any form filters using any positioning and styling that you want.

For example, when you call `f.multi_autocomplete :author`, ReportsKit will render a multi-autocomplete input. When you call `f.date_range :created_at`, it will render a date range picker.

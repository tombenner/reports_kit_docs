By default, ReportsKit shows two action buttons for each report: `Download CSV` and `Download Excel`. To disable these, pass an empty array to the `actions` option when calling `render_report`:

```haml
= render_report 'my_report', actions: []
```

To only show one of the two, pass either `'export_csv'` or `'export_xls'` as the only array element:

```haml
= render_report 'my_report', actions: ['export_csv']
```

### Customization

To apply custom formatting and/or positioning to the buttons, use `builder.export_csv_button` or `builder.export_xls_button`:

```haml
= render_report 'my_report', actions: [] do |builder|
  .download-links
    = builder.export_csv_button 'Download CSV', class: 'btn btn-small btn-primary'
    = builder.export_xls_button class: 'btn btn-small btn-primary' do
      %i.icon-download
      Excel
```

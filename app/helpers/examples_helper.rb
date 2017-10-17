module ExamplesHelper
  def render_example_text(example)
    renderer = Redcarpet::Render::HTML.new
    markdown = Redcarpet::Markdown.new(renderer, fenced_code_blocks: true)
    markdown.render(example.markdown_text).html_safe
  end

  def render_report_args_string(example)
    args = "'#{example.key}'"
    args += ", #{example.render_report_args_string}" if example.render_report_args_string
    args
  end
end

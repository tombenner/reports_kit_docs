module ExamplesHelper
  def render_example_text(example)
    renderer = Redcarpet::Render::HTML.new
    markdown = Redcarpet::Markdown.new(renderer, fenced_code_blocks: true)
    markdown.render(example.markdown_text).html_safe
  end
end

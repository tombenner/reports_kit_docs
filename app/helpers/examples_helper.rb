module ExamplesHelper
  def path_for_example(example)
    subcategory = example.subcategory
    category = example.category
    category_subcategory_example_path(category, subcategory, example)
  end

  def render_example_text(example)
    renderer = Redcarpet::Render::HTML.new
    markdown = Redcarpet::Markdown.new(renderer, fenced_code_blocks: true)
    markdown.render(example.markdown_text).html_safe
  end
end

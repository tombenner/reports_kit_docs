require 'linguist'
require 'github/markup'

module ExamplesHelper
  def path_for_example(example)
    subcategory = example.subcategory
    category = example.category
    category_subcategory_example_path(category, subcategory, example)
  end

  def render_example_text(example)
    GitHub::Markup.render_s(GitHub::Markups::MARKUP_MARKDOWN, example.markdown_text).html_safe
  end
end

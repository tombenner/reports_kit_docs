class CategoriesController < ApplicationController
  layout 'examples'

  def show
    @category = Category.find_by(key: params[:key])
    render_404 && return unless @category
    @example = @category.subcategories.map(&:examples).flatten.first
    @subcategory = @example.subcategory
    @page_title = "#{@example.category} | #{@example.subcategory} | #{@example.name}"
    render 'examples/show'
  end
end

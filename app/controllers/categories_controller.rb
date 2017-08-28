class CategoriesController < ApplicationController
  layout 'examples'

  def show
    @category = Category.find_by(key: params[:key])
    render_404 && return unless @category
    @example = @category.subcategories.map(&:examples).flatten.first
    @subcategory = @example.subcategory
    render 'examples/show'
  end
end

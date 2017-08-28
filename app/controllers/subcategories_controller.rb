class SubcategoriesController < ApplicationController
  layout 'examples'

  def show
    @subcategory = Subcategory.find_by(key: params[:key])
    render_404 && return unless @subcategory
    @category = @subcategory.category
    @example = @subcategory.examples.first
    render 'examples/show'
  end
end

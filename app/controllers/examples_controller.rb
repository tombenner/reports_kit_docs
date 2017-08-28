class ExamplesController < ApplicationController
  layout 'examples'

  def show
    key = params[:key]
    @example = Example.find_by(key: key)
    if @example.blank?
      render_404
      return
    end
    @subcategory = @example.subcategory
    @category = @example.category
    @page_title = "#{@example.category} | #{@example.subcategory} | #{@example.name}"
  end
end

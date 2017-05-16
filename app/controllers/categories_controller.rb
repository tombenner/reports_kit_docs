class CategoriesController < ApplicationController
  def index
    example = Example.first
    redirect_to category_example_path(example.category, example)
  end

  def show
    category = Category.find_by(key: params[:key])
    example = category.examples.first
    redirect_to category_example_path(example.category, example)
  end
end

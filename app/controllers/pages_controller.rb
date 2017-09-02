class PagesController < ApplicationController
  def index
    @example = Example.find_by_key('demo')
    @example_2 = Example.find_by_key('demo_2')
  end
end

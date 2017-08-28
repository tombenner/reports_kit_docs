class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ExamplesHelper

  private

  def render_404
    respond_to do |format|
      format.html { render file: Rails.root.join('public', '404'), layout: false, status: :not_found }
      format.any  { head :not_found }
    end
  end
end

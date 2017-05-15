module ApplicationHelper
  def page_title
    title = ENV['SITE_NAME']
    title = "#{title} | #{@page_title}" if @page_title.present?
    title
  end
end

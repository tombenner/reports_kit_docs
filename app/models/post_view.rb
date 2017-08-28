class PostView < ApplicationRecord
  belongs_to :post, counter_cache: :views_count

  BROWSERS = %w(Chrome Firefox IE)
  OPERATING_SYSTEMS = %w(Windows Mac iOS Android)
end

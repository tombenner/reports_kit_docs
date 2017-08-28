class Post < ApplicationRecord
  belongs_to :author
  has_many :post_views, dependent: :destroy
  has_many :posts_tags, dependent: :destroy
  has_many :tags, through: :posts_tags

  include ReportsKit::Model
  reports_kit do
    dimension :approximate_views_count, group: 'ROUND(posts.views_count, -1)'
  end

  STATUSES = %w(draft private published).freeze

  def to_s
    title
  end
end

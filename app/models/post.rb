class Post < ApplicationRecord
  belongs_to :author
  has_many :post_views, dependent: :destroy
  has_many :posts_tags, dependent: :destroy
  has_many :tags, through: :posts_tags

  include ReportsKit::Model
  reports_kit do
    aggregation :average_time_to_publish, [:average, 'posts.published_at - posts.created_at']
    contextual_filter :for_author, ->(relation, context_params) { relation.where(author_id: context_params[:author_id]) }
    dimension :approximate_views_count, group: 'ROUND(posts.views_count, -1)'
    filter :is_published, :boolean, conditions: ->(relation) { relation.where(status: 'published') }
  end

  STATUSES = %w(draft private published).freeze

  def to_s
    title
  end
end

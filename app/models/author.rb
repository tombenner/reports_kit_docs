class Author < ApplicationRecord
  has_many :posts
  has_many :tags, through: :posts

  include ReportsKit::Model
  reports_kit do
    contextual_filter :for_author, ->(relation, context_params) { relation.where(id: context_params[:author_id]) }
  end

  def to_s
    name
  end
end

class Author < ApplicationRecord
  has_many :posts
  has_many :tags, through: :posts

  def to_s
    name
  end
end

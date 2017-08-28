class Tag < ApplicationRecord
  has_many :authors, through: :posts
  has_many :posts_tags, dependent: :destroy
  has_many :posts, through: :posts_tags

  def to_s
    name
  end
end

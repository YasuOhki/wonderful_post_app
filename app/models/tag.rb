class Tag < ApplicationRecord
  validates :name, presence: true, uniqueness: {case_sensitive: false}

  has_many :tag_articles, dependent: :destroy
  has_many :articles, through: :tag_article
end

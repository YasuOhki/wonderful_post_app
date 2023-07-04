class Article < ApplicationRecord
  validates :title, presence: true, uniqueness: {case_sensitive: false}
  validates :content, presence: true, uniqueness: {case_sensitive: false}

  belongs_to :user
  has_many :tag_articles, dependent: :destroy
  has_many :tags, through: :tag_articles
end

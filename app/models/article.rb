class Article < ApplicationRecord
  validates :title, presence: true, uniqueness: {case_sensitive: false}
  validates :content, presence: true, uniqueness: {case_sensitive: false}

  belongs_to :user
  has_many :tag_article
  has_many :tag, through: :tag_article
end

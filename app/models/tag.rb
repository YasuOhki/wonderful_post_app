class Tag < ApplicationRecord
  validates :name, presence: true, uniqueness: {case_sensitive: false}

  has_many :article
  has_many :article, through: :tag_article
end

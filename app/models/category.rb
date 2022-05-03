class Category < ApplicationRecord
  has_many :post_categories, dependent: :destroy, foreign_key: 'category_id'
  has_many :posts, through: :post_categories, dependent: :destroy
  validates :name, uniqueness: true, presence: true
end

class Post < ApplicationRecord
  has_one_attached :images

  has_many :post_comments, dependent: :destroy
   has_many :post_categories, dependent: :destroy
  has_many :category, through: :post_categories, optional: true
  belongs_to :user

  validates :place, :description, presence: true

end

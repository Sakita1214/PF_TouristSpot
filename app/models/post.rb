class Post < ApplicationRecord
  has_one_attached :images

  has_many :post_comments, dependent: :destroy

  belongs_to :user
  belongs_to :category, optional: true

  validates :place, :description, presence: true

end

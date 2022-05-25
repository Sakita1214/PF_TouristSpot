class PostComment < ApplicationRecord

  belongs_to :user
  belongs_to :post
  has_many :tags

  validates :comment, presence: true

  has_one_attached :image

end

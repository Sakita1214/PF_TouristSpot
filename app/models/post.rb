class Post < ApplicationRecord
  has_one_attached :images

  has_many :post_comments, dependent: :destroy
  has_many :post_categories, dependent: :destroy

  belongs_to :user

  validates :place, :description, :post_categories, presence: true

  # reject_ifは、入力フォームを追加しているもののすべてが空白の場合にリジェクトする
  # allow_destroyは、入力フォームでこのオブジェクトが削除された際に削除を許可する
  validates_associated :post_categories
  accepts_nested_attributes_for :post_categories, reject_if: :all_blank, allow_destroy: true

end

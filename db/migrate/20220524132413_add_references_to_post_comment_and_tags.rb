class AddReferencesToPostCommentAndTags < ActiveRecord::Migration[6.1]
  def change
    add_reference :tags, :post_comment, null: false, foreign_key: true
  end
end

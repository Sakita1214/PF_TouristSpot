class CreatePostCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :post_categories do |t|
      t.integer :post, foreign_key: true
      t.integer :category, foreign_key: true

      t.timestamps
    end
    # 同じタグを２回保存するのは出来ないようになる
    add_index :post_categories, [:post_id, :category_id], unique: true
  end
end

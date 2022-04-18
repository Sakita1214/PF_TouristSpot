class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :place
      t.text :description
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end

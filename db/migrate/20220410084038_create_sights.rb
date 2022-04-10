class CreateSights < ActiveRecord::Migration[6.1]
  def change
    create_table :sights do |t|
      t.integer :post_id
      t.integer :category_id
      t.string :place
      t.string :address
      t.text :description
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end

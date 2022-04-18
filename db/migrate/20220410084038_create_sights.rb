class CreateSights < ActiveRecord::Migration[6.1]
  def change
    create_table :sights do |t|
      t.integer :post_id
      t.string :address
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end

class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user
      t.string  :image
      t.string  :name
      t.text    :explanation
      t.integer :price
      t.integer :category
      t.integer :quality
      t.integer :delivery_fee
      t.integer :shipping_area
      t.integer :shipping_date
      t.integer :good_point 
      t.timestamps
    end
  end
end

class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code
      t.integer :prefectures
      t.string :city
      t.string :address
      t.string :building
      t.string :phone_number
      t.timestamps
    end
  end
end

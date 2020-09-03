class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,             null:false, foreignkey:true
      t.string     :name,             null:false
      t.text       :explanation,      null:false
      t.integer    :price,            null:false
      t.integer    :category_id,      null:false
      t.integer    :quality_id,       null:false
      t.integer    :delivery_fee_id,  null:false
      t.integer    :shipping_area_id, null:false
      t.integer    :shipping_date_id, null:false
      t.integer    :good_point 
      t.timestamps
    end
  end
end

class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,               null: false
      t.integer :category_id,       null: false 
      t.text :explanation,          null: false
      t.integer :price,             null: false
      t.integer :status_id,         null: false
      t.integer :shipping_id,       null: false
      t.integer :shipping_place_id, null: false
      t.integer :date_shipment_id,  null: false
      t.references :user,           null: false
      t.string :message, null:false
      t.timestamps
    end
  end
end

class CreateAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :areas do |t|
      t.string :postcode,             null: false
      t.string :shipping_place_id,    null: false
      t.string :city,                 null: false
      t.string :block,                null: false
      t.string :building,             null: false
      t.string :phone,                null: false
      t.references record,           foreign_key: true
      t.timestamps
    end
  end
end

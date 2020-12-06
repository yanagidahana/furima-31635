class CreateItemsTagRelation < ActiveRecord::Migration[6.0]
  def change
    create_table :items_tag_relations do |t|
      t.references :item, foreign_key: true
      t.references :tag, foreign_key: true
    end
  end
end

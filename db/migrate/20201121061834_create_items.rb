class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.name
    end
  end
end

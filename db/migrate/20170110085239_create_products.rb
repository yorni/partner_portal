class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :part_number
      t.string :name
      t.string :description
      t.decimal :price
      t.integer :stock
      t.references :manufacturer, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :product_name, null: false
      t.text :description, null: false
      t.text :bullets, array: true, default: []
      t.float :price, null: false
      t.integer :inventory, null: false
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end

    add_index :products, :product_name, unique: true
  end
end
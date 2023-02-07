class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :product_name, null: false
      t.text :description, null: false
      t.string :product_image

      t.timestamps
    end

    add_index :products, :product_name, unique: true
  end
end

class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :category_name, null: false

      t.timestamps
    end

    add_index :categories, :category_name, unique: true
  end
end

class CreateOrderHistoryItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_history_items do |t|
      t.references :user, foreign_key: true, null: false
      t.references :product, foreign_key: true, null: false
      t.integer :quantity, null: false, default: 1
      t.string :order_confirmation, null: false

      t.timestamps
    end

    add_index :order_history_items, :order_confirmation
  end
end

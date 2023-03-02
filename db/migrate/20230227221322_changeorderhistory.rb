class Changeorderhistory < ActiveRecord::Migration[7.0]
  def change

    add_column :order_history_items, :item_total, :float, null: false
    add_column :order_history_items, :order_total, :float, null: false
  end
end

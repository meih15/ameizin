@order_history_items.each do |order_history_item|
    json.set! order_history_item.id do 
        json.extract! order_history_item, :id, :product_id, :user_id, :quantity, :item_total, :order_total, :order_confirmation, :created_at
    end
end


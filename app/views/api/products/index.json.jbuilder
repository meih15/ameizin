@products.each do |product|
    json.set! product.id do 
        json.extract! product, :id, :product_name, :description, :bullets, :price, :inventory, :category_id
    end
end


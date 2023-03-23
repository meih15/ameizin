@products.each do |product|
    json.set! product.id do 
        json.extract! product, :id, :product_name, :description, :bullets, :price, :inventory, :category_id, :photourl
        # json.photourl url_for(product.photo)
    end
end


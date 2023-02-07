@categories.each do |category|
    json.set! category.id do 
        json.extract! category, :id, :category_name, :created_at, :updated_at
    end
end


json.extract! @product, :id, :product_name, :description, :bullets, :price, :inventory, :category_id
json.photourl url_for(@product.photo)

# json.partial! "product", product: @product

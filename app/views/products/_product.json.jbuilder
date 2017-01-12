json.extract! product, :id, :part_number, :name, :description, :price, :stock, :manufacturer_id, :category_id, :created_at, :updated_at
json.url product_url(product, format: :json)
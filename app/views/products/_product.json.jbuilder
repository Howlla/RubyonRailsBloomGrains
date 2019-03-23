json.extract! product, :id, :name, :rate, :created_at, :updated_at
json.url product_url(product, format: :json)

json.extract! cart, :id, :name, :price, :quantity, :created_at, :updated_at
json.url cart_url(cart, format: :json)

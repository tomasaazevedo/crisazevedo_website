json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :dimensions, :weight, :material, :product_code, :is_new_release
  json.url product_url(product, format: :json)
end

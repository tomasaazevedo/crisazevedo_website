json.array!(@sub_collections) do |sub_collection|
  json.extract! sub_collection, :id, :name, :description
  json.url sub_collection_url(sub_collection, format: :json)
end

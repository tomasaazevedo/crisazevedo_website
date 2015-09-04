json.array!(@collection_images) do |collection_image|
  json.extract! collection_image, :id, :collection_image
  json.url collection_image_url(collection_image, format: :json)
end

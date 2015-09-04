json.array!(@sub_collection_images) do |sub_collection_image|
  json.extract! sub_collection_image, :id, :sub_collection_image
  json.url sub_collection_image_url(sub_collection_image, format: :json)
end

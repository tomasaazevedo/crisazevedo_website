json.array!(@highlights) do |highlight|
  json.extract! highlight, :id, :title, :details, :link, :is_active, :image
  json.url highlight_url(highlight, format: :json)
end

json.array!(@properties) do |property|
  json.extract! property, :id, :key, :value, :activity_id
  json.url property_url(property, format: :json)
end

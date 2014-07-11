json.array!(@ports) do |port|
  json.extract! port, :id, :data_type, :port_type, :is_optional, :activity_id
  json.url port_url(port, format: :json)
end

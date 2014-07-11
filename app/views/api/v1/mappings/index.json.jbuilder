json.array!(@mappings) do |mapping|
  json.extract! mapping, :id, :in_id, :out_id
  json.url mapping_url(mapping, format: :json)
end

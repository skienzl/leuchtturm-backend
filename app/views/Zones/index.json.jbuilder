json.array!(@zones) do |zone|
  json.extract! zone, :id, :name, :description, :next_id, :prev_id, :lat, :lon, :technology, :accuracy, :identifier, :minor, :major, :shape, :collection_id, :task_id, :harbor_id
  json.url zone_url(zone, format: :json)
end

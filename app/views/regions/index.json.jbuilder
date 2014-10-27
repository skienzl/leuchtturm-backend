json.array!(@regions) do |region|
  json.extract! region, :id, :name, :description, :next_id, :prev_id, :lat, :lon, :technology, :accuracy, :identifier, :minor, :major, :shape, :collection_id, :task_id, :harbor_id
  json.url region_url(region, format: :json)
end

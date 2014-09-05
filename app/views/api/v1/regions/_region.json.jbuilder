json.extract! region, :id, :name, :description, :next_id, :prev_id, :technology, :accuracy, :identifier, :minor, :major, :shape
json.location do
  json.lat region.lat
  json.lon region.lon
end
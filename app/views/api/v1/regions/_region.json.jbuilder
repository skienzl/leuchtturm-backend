json.extract! region, :id, :name, :description, :task_id, :next_id, :prev_id, :technology, :accuracy, :identifier, :minor, :major, :shape
json.location do
  json.lat region.lat
  json.lon region.lon
end
json.settings region.settings, partial: 'api/v1/settings/setting', as: :setting
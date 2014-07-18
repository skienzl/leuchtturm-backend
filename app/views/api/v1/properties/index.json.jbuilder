json.array!(@properties) do |property|
  json.extract! property, :id, :key, :value, :activity_id
end

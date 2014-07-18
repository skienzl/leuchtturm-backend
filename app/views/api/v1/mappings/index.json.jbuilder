json.array!(@mappings) do |mapping|
  json.extract! mapping, :id, :in_id, :out_id
end

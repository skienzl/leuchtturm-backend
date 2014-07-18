json.array!(@ports) do |port|
  json.extract! port, :id, :data_type, :port_type, :is_optional, :activity_id
end

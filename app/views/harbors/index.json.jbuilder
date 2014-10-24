json.array!(@harbors) do |harbor|
  json.extract! harbor, :id, :name, :description
  json.url harbor_url(harbor, format: :json)
end

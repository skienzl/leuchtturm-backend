json.array!(@harbors) do |harbor|
  json.extract! harbor, :id, :name, :description
  json.url api_harbor_url(harbor, format: :json)
end

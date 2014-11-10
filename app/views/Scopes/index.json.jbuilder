json.array!(@scopes) do |scope|
  json.extract! scope, :id, :name, :description
  json.url scope_url(scope, format: :json)
end

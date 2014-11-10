json.scopes do |json|
	json.array!(@scopes) do |scope|
	  json.extract! scope, :id, :name, :description
	  json.url api_scope_url(scope, format: :json)
	end
end

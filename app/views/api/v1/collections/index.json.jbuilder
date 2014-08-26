json.collections do |json|
	json.array!(@collections) do |collection|
	  json.extract! collection, :id, :name, :description
	end
end

json.extract! activity, :id, :identifier, :name, :description, :task_id
json.properties activity.properties, partial: 'api/v1/properties/property', as: :property
json.ports activity.ports, partial: 'api/v1/ports/port', as: :port


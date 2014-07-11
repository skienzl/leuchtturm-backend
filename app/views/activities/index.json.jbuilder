json.array!(@activities) do |activity|
  json.extract! activity, :id, :identifier, :name, :description, :task_id
  json.url activity_url(activity, format: :json)
end

json.harbor do |json| 
  json.extract! @harbor, :id, :name, :description
  json.zones @harbor.zones, partial: 'api/v1/zones/zone', as: :zone
  json.tasks @harbor.tasks, partial: 'api/v1/tasks/task', as: :task
end


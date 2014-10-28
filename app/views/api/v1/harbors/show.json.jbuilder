json.harbor do |json| 
  json.extract! @harbor, :id, :name, :description
  json.regions @harbor.regions, partial: 'api/v1/regions/region', as: :region
  json.tasks @harbor.tasks, partial: 'api/v1/tasks/task', as: :task
end


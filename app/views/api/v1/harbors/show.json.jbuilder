json.harbor do |json| 
  json.extract! @harbor, :id, :name, :description
  json.collections @harbor.collections, partial: 'api/v1/collections/collection', as: :coll
  json.tasks @harbor.tasks, partial: 'api/v1/tasks/task', as: :task
end


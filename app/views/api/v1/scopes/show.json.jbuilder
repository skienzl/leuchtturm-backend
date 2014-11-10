json.scope do |json|
  json.extract! @scope, :id, :name, :description
  json.zones @scope.zones, partial: 'api/v1/zones/zone', as: :zone
  json.tasks @scope.tasks, partial: 'api/v1/tasks/task', as: :task
end


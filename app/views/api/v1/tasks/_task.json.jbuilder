json.extract! task, :id, :name, :description
json.activities task.activities, partial: 'api/v1/activities/activity', as: :activity
json.mappings task.mappings, partial: 'api/v1/mappings/mapping', as: :mapping




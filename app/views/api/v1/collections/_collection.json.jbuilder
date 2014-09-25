json.extract! coll, :id, :name, :description, :harbor_id
json.regions coll.regions, partial: 'api/v1/regions/region', as: :region
json.extract! coll, :id, :name, :description
json.regions coll.regions, partial: 'api/v1/regions/region', as: :region
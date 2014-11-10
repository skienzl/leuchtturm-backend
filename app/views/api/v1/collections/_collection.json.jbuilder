json.extract! coll, :id, :name, :description
json.zones coll.zones, partial: 'api/v1/zones/zone', as: :zone
json.extract! @harbor, :id, :name, :description, :created_at, :updated_at
json.collections @harbor.collections, :id, :name, :description, :created_at, :updated_at

json.collections @harbor.collections do |collection|
  json.id collection.id
  json.name collection.name
  json.description collection.description
  #json.created_at collection.created_at
  #json.updated_at collection.updated_at
  #json.url url_for(collection)

  json.regions collection.regions do |region|
    json.id region.id
    json.name region.name
    json.description region.description
    #json.created_at region.created_at
    #json.updated_at region.updated_at

    json.task do
      json.id region.task.id
      json.name region.task.name
      json.description region.task.description
      json.next region.next_id
      json.previous region.prev_id
      json.gps do
        json.lat region.lat
        json.lon region.lon
      end
      json.technology region.technology
      json.accuracy region.accuracy
      json.identifier region.identifier
      json.minor region.minor
      json.major region.major
      json.shape region.shape
      #json.created_at region.task.created_at
      #json.updated_at region.task.updated_at

      json.activities region.task.activities do |activity|
        json.id activity.id
        json.name activity.name
        json.description activity.description
        #json.created_at activity.created_at
        #json.updated_at activity.updated_at

        json.properties activity.properties do |property|
          json.key property.key
          json.value property.value
          #json.created_at property.created_at
          #json.updated_at property.updated_at
        end

        json.ports activity.ports do |port|
          json.data_type port.data_type
          json.port_type port.port_type
          json.is_optional port.is_optional
          #json.created_at port.created_at
          #json.updated_at port.updated_at
        end

        #json.mappings activity.mappings do |mapping|
          #json.in mapping.in_id
          #json.out mapping.out_id
          #json.created_at mapping.created_at
          #json.updated_at mapping.updated_at
        #end

      end

    end

  end

end
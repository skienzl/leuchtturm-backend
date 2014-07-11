require 'api_constraints'

Rails.application.routes.draw do

  namespace :api, defaults: {format: :json} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: :true) do

      resources :harbors do
        resources :collections do
          resources :regions do
            resources :tasks do
              resources :activities do
                resources :mappings
                resources :properties
                resources :ports
              end
            end
          end
        end
      end
    end
  end

  resources :activities
  resources :mappings
  resources :properties
  resources :ports
  resources :regions
  resources :tasks
  resources :harbors
  resources :collections

end

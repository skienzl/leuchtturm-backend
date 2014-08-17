require 'api_constraints'

Rails.application.routes.draw do

  root to: "home#index"
  resources :users

  use_doorkeeper
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}

  namespace :api, defaults: {format: :json} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: :true) do

      resources :harbors do
        resources :collections do
          resources :regions
        end
        resources :tasks do
          resources :activities do
            resources :properties
            resources :ports
          end
          resources :mappings
        end
      end
    end
  end

end

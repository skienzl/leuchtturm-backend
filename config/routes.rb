require 'api_constraints'

Rails.application.routes.draw do

  root to: "home#index"
  resources :users

  use_doorkeeper
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}

  namespace :api, defaults: {format: :json} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: :true) do

      resources :harbors 
      resources :collections 
      resources :regions
      resources :tasks 
      resources :activities 
      resources :properties
      resources :ports
      resources :mappings
  end
end
end

require 'api_constraints'

Rails.application.routes.draw do
  resources :harbors do
    resources :zones
  end
  get 'harbors/:id/delete' => 'harbors#delete'

  root to: "home#index"
  resources :users

  use_doorkeeper
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}

  namespace :api, defaults: {format: :json} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: :true) do

      resources :harbors 
      resources :collections, :except => :index
      resources :zones,     :except => :index
      resources :tasks,       :except => :index
      resources :activities,  :except => :index
      resources :properties,  :except => :index
      resources :ports,       :except => :index
      resources :mappings,    :except => :index
      resources :settings,    :except => :index

    end
  end
end

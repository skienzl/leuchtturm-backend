class Api::V1::ApiController < ApplicationController
  before_action :doorkeeper_authorize!
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/vnd.myapp.v1' }

  def create_save_with_response(object)
    if object.save
      render :show, status: :created, location: object
    else
      render json: object.errors, status: :unprocessable_entity
    end
  end

  def update_with_response(object, parameters)
    if object.update(parameters)
      render :show, status: :ok, location: object
    else
      render json: object.errors, status: :unprocessable_entity
    end
  end

  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end
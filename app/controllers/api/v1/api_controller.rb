module ApiError
  NOT_FOUND         = 1
  VALIDATION_FAILED = 2
end

class Api::V1::ApiController < ActionController::Base
  #doorkeeper_for :all
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/vnd.myapp.v1' }
  respond_to :json

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  API_ERROR_CODES = {
      ApiError::NOT_FOUND         => 'Object not found',
      ApiError::VALIDATION_FAILED => 'Object validation failed'
  }

  def create_save_with_response(object)
    if object.save
      render json: {object.class.name.downcase => object}, status: :created
    else
      render json: {error: object.errors, code: ApiError::VALIDATION_FAILED}, status: :unprocessable_entity
    end
  end

  def update_with_response(object, parameters)
    if object.update(parameters)
      render json: {object.class.name.downcase => object}, status: :ok
    else
      render json: {error: object.errors, code: ApiError::VALIDATION_FAILED}, status: :unprocessable_entity
    end
  end

  private
    def record_not_found
      render json: {error: 'Object not found.', code: ApiError::NOT_FOUND}, status: :not_found
    end

end
class Api::V1::PropertiesController < Api::V1::ApiController
  before_action :set_property, only: [:show, :update, :destroy]

  # GET /properties
  def index
    @properties = Property.where(activity_id: params[:activity_id])
  end

  # GET /properties/1
  def show
  end

  # POST /properties
  def create
    @property = Property.new(property_params)
    create_save_with_response(@property)
  end

  # PATCH/PUT /properties/1
  def update
    update_with_response(@property, property_params)
  end

  # DELETE /properties/1
  def destroy
    @property.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
      params.require(:property).permit(:key, :value, :activity_id)
    end
end

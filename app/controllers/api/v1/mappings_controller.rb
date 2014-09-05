class Api::V1::MappingsController < Api::V1::ApiController
  before_action :set_mapping, only: [:show, :update, :destroy]

  # GET /mappings
  def index
    @mappings = []
  end

  # GET /mappings/1
  def show
  end

  # POST /mappings
  def create
    @mapping = Mapping.new(mapping_params)
    create_save_with_response(@mapping)
  end

  # PATCH/PUT /mappings/1
  def update
    update_with_response(@mapping, mapping_params)
  end

  # DELETE /mappings/1
  def destroy
    @mapping.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mapping
      @mapping = Mapping.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mapping_params
      params.require(:mapping).permit(:in_id, :out_id)
    end
end

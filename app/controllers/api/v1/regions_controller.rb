class Api::V1::RegionsController < Api::V1::ApiController
  before_action :set_region, only: [:show, :update, :destroy]

  # GET /regions
  def index
    @regions = []
  end

  # GET /regions/1
  def show
  end

  # POST /regions
  def create
    @region = Region.new(region_params)
    create_save_with_response(@region)
  end

  # PATCH/PUT /regions/1
  def update
    update_with_response(@region, region_params)
  end

  # DELETE /regions/1
  def destroy
    @region.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_region
      Region.transaction do
        @region = Region.all.includes(:settings).find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def region_params
      params.require(:region).permit(:name, :description, :next_id, :prev_id, :lat, :lon, :technology, :accuracy, :identifier, :minor, :major, :shape, :collection_id, :task_id, :lat, :lon, settings: [])
    end
end

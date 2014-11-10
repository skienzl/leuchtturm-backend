class Api::V1::ZonesController < Api::V1::ApiController
  before_action :set_zone, only: [:show, :update, :destroy]

  # GET /zones
  def index
    @zones = []
  end

  # GET /zones/1
  def show
  end

  # POST /zones
  def create
    @zone = Zone.new(zone_params)
    create_save_with_response(@zone)
  end

  # PATCH/PUT /zones/1
  def update
    update_with_response(@zone, zone_params)
  end

  # DELETE /zones/1
  def destroy
    @zone.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zone
      Zone.transaction do
        @zone = Zone.all.includes(:settings).find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def zone_params
      params.require(:zone).permit(:name, :description, :next_id, :prev_id, :lat, :lon, :technology, :accuracy, :identifier, :minor, :major, :shape, :collection_id, :task_id, :lat, :lon, settings: [])
    end
end

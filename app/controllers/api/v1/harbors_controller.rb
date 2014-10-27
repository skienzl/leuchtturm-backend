class Api::V1::HarborsController < Api::V1::ApiController
  before_action :set_harbor, only: [:show, :update, :destroy]

  # GET /harbors
  def index
    @harbors = Harbor.all
  end

  # GET /harbors/1
  def show
  end

  # POST /harbors
  def create
    @harbor = Harbor.new(harbor_params)
    create_save_with_response(@harbor)
  end

  # PATCH/PUT /harbors/1
  def update
    update_with_response(@harbor, harbor_params)
  end

  # DELETE /harbors/1
  def destroy
    @harbor.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_harbor
      Harbor.transaction do
        @harbor = Harbor.all.includes(regions: [:settings], tasks: [mappings: [:properties], activities: [:ports, :properties]]).find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def harbor_params
      params.require(:harbor).permit(:name, :description)
    end
end

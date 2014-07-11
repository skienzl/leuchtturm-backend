class Api::V1::PortsController < Api::V1::ApiController
  before_action :set_port, only: [:show, :update, :destroy]

  # GET /ports
  def index
    @ports = Port.all
  end

  # GET /ports/1
  def show
  end

  # POST /ports
  def create
    @port = Port.new(port_params)
    create_save_with_response(@port)
  end

  # PATCH/PUT /ports/1
  def update
    update_with_response(@port, port_params)
  end

  # DELETE /ports/1
  def destroy
    @port.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_port
      @port = Port.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def port_params
      params.require(:port).permit(:data_type, :port_type, :is_optional, :activity_id)
    end
end

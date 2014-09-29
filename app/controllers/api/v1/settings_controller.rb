class Api::V1::SettingsController < Api::V1::ApiController
  before_action :set_setting, only: [:show, :update, :destroy]

  # GET /settings
  def index
    @settings = []
  end

  # GET /settings/1
  def show
  end

  # POST /settings
  def create
    @setting = Setting.new(setting_params)
    create_save_with_response(@setting)
  end

  # PATCH/PUT /settings/1
  def update
    update_with_response(@setting, setting_params)
  end

  # DELETE /settings/1
  def destroy
    @setting.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_setting
      Setting.transaction do
        @setting = Setting.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def setting_params
      params.require(:setting).permit(:key, :value, :region_id)
    end
end

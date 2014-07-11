class Api::V1::ActivitiesController < Api::V1::ApiController
  before_action :set_activity, only: [:show, :update, :destroy]

  # GET /activities
  def index
    @activities = Activity.all
  end

  # GET /activities/1
  def show
  end

  # POST /activities
  def create
    @activity = Activity.new(activity_params)
    create_save_with_response(@activity)
  end

  # PATCH/PUT /activities/1
  def update
    update_with_response(@activity, activity_params)
  end

  # DELETE /activities/1
  def destroy
    @activity.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit(:identifier, :name, :description, :task_id)
    end
end

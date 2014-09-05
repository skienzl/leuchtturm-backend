class Api::V1::TasksController < Api::V1::ApiController
  before_action :set_task, only: [:show, :update, :destroy]

  # GET /tasks
  def index
    @tasks = []
  end

  # GET /tasks/1
  def show
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)
    create_save_with_response(@task)
  end

  # PATCH/PUT /tasks/1
  def update
    update_with_response(@task, task_params)
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :description, :region_id)
    end
end

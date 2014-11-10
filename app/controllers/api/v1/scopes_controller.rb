class Api::V1::ScopesController < Api::V1::ApiController
  before_action :set_scope, only: [:show, :update, :destroy]

  # GET /scopes
  def index
    @scopes = Scope.all
  end

  # GET /scopes/1
  def show
  end

  # POST /scopes
  def create
    @scope = Scope.new(scope_params)
    create_save_with_response(@scope)
  end

  # PATCH/PUT /scopes/1
  def update
    update_with_response(@scope, scope_params)
  end

  # DELETE /scopes/1
  def destroy
    @scope.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scope
      Scope.transaction do
        @scope = Scope.all.includes(zones: [:settings], tasks: [mappings: [:properties], activities: [:ports, :properties]]).find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scope_params
      params.require(:scope).permit(:name, :description)
    end
end

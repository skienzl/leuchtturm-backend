class Api::V1::CollectionsController < Api::V1::ApiController
  before_action :set_collection, only: [:show, :update, :destroy]

  # GET /collections
  def index
    @collections = []
  end

  # GET /collections/1
  def show
  end

  # POST /collections
  def create
    @collection = Collection.new(collection_params)
    create_save_with_response(@collection)
  end

  # PATCH/PUT /collections/1
  def update
    update_with_response(@collection, collection_params)
  end

  # DELETE /collections/1
  def destroy
    @collection.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collection
      @collection = Collection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def collection_params
      params.require(:collection).permit(:name, :description, :harbor_id)
    end
end

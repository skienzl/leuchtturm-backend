class HarborsController < ApplicationController
  before_action :set_harbor, only: [:show, :edit, :update, :destroy]

  # GET /harbors
  # GET /harbors.json
  def index
    @harbors = Harbor.all
  end

  # GET /harbors/1
  # GET /harbors/1.json
  def show
  end

  # GET /harbors/new
  def new
    @harbor = Harbor.new
  end

  # GET /harbors/1/edit
  def edit
  end

  # POST /harbors
  # POST /harbors.json
  def create
    @harbor = Harbor.new(harbor_params)

    respond_to do |format|
      if @harbor.save
        format.html { redirect_to @harbor, notice: 'Harbor was successfully created.' }
        format.json { render :show, status: :created, location: @harbor }
      else
        format.html { render :new }
        format.json { render json: @harbor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /harbors/1
  # PATCH/PUT /harbors/1.json
  def update
    respond_to do |format|
      if @harbor.update(harbor_params)
        format.html { redirect_to @harbor, notice: 'Harbor was successfully updated.' }
        format.json { render :show, status: :ok, location: @harbor }
      else
        format.html { render :edit }
        format.json { render json: @harbor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /harbors/1
  # DELETE /harbors/1.json
  def destroy
    @harbor.destroy
    respond_to do |format|
      format.html { redirect_to harbors_url, notice: 'Harbor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_harbor
      @harbor = Harbor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def harbor_params
      params.require(:harbor).permit(:name, :description)
    end
end

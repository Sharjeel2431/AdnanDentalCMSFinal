class TblSlideLayersController < ApplicationController
  before_action :set_tbl_slide_layer, only: [:show, :edit, :update, :destroy]

  # GET /tbl_slide_layers
  # GET /tbl_slide_layers.json
  def index
    @tbl_slide_layers = TblSlideLayer.all
  end

  # GET /tbl_slide_layers/1
  # GET /tbl_slide_layers/1.json
  def show
  end

  # GET /tbl_slide_layers/new
  def new
    @tbl_slide_layer = TblSlideLayer.new
  end

  # GET /tbl_slide_layers/1/edit
  def edit
  end

  # POST /tbl_slide_layers
  # POST /tbl_slide_layers.json
  def create
    @tbl_slide_layer = TblSlideLayer.new(tbl_slide_layer_params)

    respond_to do |format|
      if @tbl_slide_layer.save
        format.html { redirect_to @tbl_slide_layer, notice: 'Tbl slide layer was successfully created.' }
        format.json { render :show, status: :created, location: @tbl_slide_layer }
      else
        format.html { render :new }
        format.json { render json: @tbl_slide_layer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tbl_slide_layers/1
  # PATCH/PUT /tbl_slide_layers/1.json
  def update
    respond_to do |format|
      if @tbl_slide_layer.update(tbl_slide_layer_params)
        format.html { redirect_to @tbl_slide_layer, notice: 'Tbl slide layer was successfully updated.' }
        format.json { render :show, status: :ok, location: @tbl_slide_layer }
      else
        format.html { render :edit }
        format.json { render json: @tbl_slide_layer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tbl_slide_layers/1
  # DELETE /tbl_slide_layers/1.json
  def destroy
    @tbl_slide_layer.destroy
    respond_to do |format|
      format.html { redirect_to tbl_slide_layers_url, notice: 'Tbl slide layer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tbl_slide_layer
      @tbl_slide_layer = TblSlideLayer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tbl_slide_layer_params
      params.require(:tbl_slide_layer).permit(:SlideID, :LayerID)
    end
end

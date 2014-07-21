class TblMediaController < ApplicationController
  before_action :set_tbl_medium, only: [:show, :edit, :update, :destroy]

  # GET /tbl_media
  # GET /tbl_media.json
  def index
    @tbl_media = TblMedium.all
  end

  # GET /tbl_media/1
  # GET /tbl_media/1.json
  def show
  end

  # GET /tbl_media/new
  def new
    @tbl_medium = TblMedium.new
  end

  # GET /tbl_media/1/edit
  def edit
  end

  # POST /tbl_media
  # POST /tbl_media.json
  def create
    @tbl_medium = TblMedium.new(tbl_medium_params)

    respond_to do |format|
      if @tbl_medium.save
        format.html { redirect_to @tbl_medium, notice: 'Tbl medium was successfully created.' }
        format.json { render :show, status: :created, location: @tbl_medium }
      else
        format.html { render :new }
        format.json { render json: @tbl_medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tbl_media/1
  # PATCH/PUT /tbl_media/1.json
  def update
    respond_to do |format|
      if @tbl_medium.update(tbl_medium_params)
        format.html { redirect_to @tbl_medium, notice: 'Tbl medium was successfully updated.' }
        format.json { render :show, status: :ok, location: @tbl_medium }
      else
        format.html { render :edit }
        format.json { render json: @tbl_medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tbl_media/1
  # DELETE /tbl_media/1.json
  def destroy
    @tbl_medium.destroy
    respond_to do |format|
      format.html { redirect_to tbl_media_url, notice: 'Tbl medium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tbl_medium
      @tbl_medium = TblMedium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tbl_medium_params
      params.require(:tbl_medium).permit(:MediaID, :Value, :Value2, :ToolTip, :RedirectLink, :Type, :Status)
    end
end

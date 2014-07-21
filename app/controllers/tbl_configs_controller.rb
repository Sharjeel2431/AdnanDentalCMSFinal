class TblConfigsController < ApplicationController
  before_action :set_tbl_config, only: [:show, :edit, :update, :destroy]

  # GET /tbl_configs
  # GET /tbl_configs.json
  def index
    @tbl_configs = TblConfig.all
  end

  # GET /tbl_configs/1
  # GET /tbl_configs/1.json
  def show
  end

  # GET /tbl_configs/new
  def new
    @tbl_config = TblConfig.new
  end

  # GET /tbl_configs/1/edit
  def edit
  end

  # POST /tbl_configs
  # POST /tbl_configs.json
  def create
    @tbl_config = TblConfig.new(tbl_config_params)

    respond_to do |format|
      if @tbl_config.save
        format.html { redirect_to @tbl_config, notice: 'Tbl config was successfully created.' }
        format.json { render :show, status: :created, location: @tbl_config }
      else
        format.html { render :new }
        format.json { render json: @tbl_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tbl_configs/1
  # PATCH/PUT /tbl_configs/1.json
  def update
    respond_to do |format|
      if @tbl_config.update(tbl_config_params)
        format.html { redirect_to @tbl_config, notice: 'Tbl config was successfully updated.' }
        format.json { render :show, status: :ok, location: @tbl_config }
      else
        format.html { render :edit }
        format.json { render json: @tbl_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tbl_configs/1
  # DELETE /tbl_configs/1.json
  def destroy
    @tbl_config.destroy
    respond_to do |format|
      format.html { redirect_to tbl_configs_url, notice: 'Tbl config was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tbl_config
      @tbl_config = TblConfig.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tbl_config_params
      params.require(:tbl_config).permit(:ConfigID, :ConfigTitle, :ConfigValue, :Type, :Status)
    end
end

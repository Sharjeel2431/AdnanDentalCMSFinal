class TblPicSettingsController < ApplicationController
  before_action :set_tbl_pic_setting, only: [:show, :edit, :update, :destroy]

  # GET /tbl_pic_settings
  # GET /tbl_pic_settings.json
  def index
    @tbl_pic_settings = TblPicSetting.all
  end

  # GET /tbl_pic_settings/1
  # GET /tbl_pic_settings/1.json
  def show
  end

  # GET /tbl_pic_settings/new
  def new
    @tbl_pic_setting = TblPicSetting.new
  end

  # GET /tbl_pic_settings/1/edit
  def edit
  end

  # POST /tbl_pic_settings
  # POST /tbl_pic_settings.json
  def create
    @tbl_pic_setting = TblPicSetting.new(tbl_pic_setting_params)

    respond_to do |format|
      if @tbl_pic_setting.save
        format.html { redirect_to @tbl_pic_setting, notice: 'Tbl pic setting was successfully created.' }
        format.json { render :show, status: :created, location: @tbl_pic_setting }
      else
        format.html { render :new }
        format.json { render json: @tbl_pic_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tbl_pic_settings/1
  # PATCH/PUT /tbl_pic_settings/1.json
  def update
    respond_to do |format|
      if @tbl_pic_setting.update(tbl_pic_setting_params)
        format.html { redirect_to @tbl_pic_setting, notice: 'Tbl pic setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @tbl_pic_setting }
      else
        format.html { render :edit }
        format.json { render json: @tbl_pic_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tbl_pic_settings/1
  # DELETE /tbl_pic_settings/1.json
  def destroy
    @tbl_pic_setting.destroy
    respond_to do |format|
      format.html { redirect_to tbl_pic_settings_url, notice: 'Tbl pic setting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tbl_pic_setting
      @tbl_pic_setting = TblPicSetting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tbl_pic_setting_params
      params.require(:tbl_pic_setting).permit(:PicSettingID, :Title, :Height, :Width, :Type, :Mode, :Constraints, :Status)
    end
end

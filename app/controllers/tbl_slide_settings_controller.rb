class TblSlideSettingsController < ApplicationController
  before_action :set_tbl_slide_setting, only: [:show, :edit, :update, :destroy]

  # GET /tbl_slide_settings
  # GET /tbl_slide_settings.json
  def index
    @tbl_slide_settings = TblSlideSetting.all
    session[:fromaddslidebanner]=0
  end

  # GET /tbl_slide_settings/1
  # GET /tbl_slide_settings/1.json
  def show
  end

  # GET /tbl_slide_settings/new
  def new
    @tbl_slide_setting = TblSlideSetting.new
  end

  # GET /tbl_slide_settings/1/edit
  def edit
  end

  # POST /tbl_slide_settings
  # POST /tbl_slide_settings.json
  def create
    @tbl_slide_setting = TblSlideSetting.new(tbl_slide_setting_params)

    respond_to do |format|

      if @tbl_slide_setting.save

        if params[:fadein_hid] == ""

          params[:fadein_hid]="true"
        end

        if params[:fadeout_hid] == ""
          params[:fadeout_hid]="true"
        end

        @slidesettinfo=TblSlideSetting.last()

        quer='UPDATE tbl_slide_settings SET "fadein"='+"'"+"#{params[:fadein_hid]}"+"'"+' WHERE "SlideSettingID"='+"#{@slidesettinfo.SlideSettingID}"+';'
        quer_second='UPDATE tbl_slide_settings SET "fadeout"='+"'"+"#{params[:fadeout_hid]}"+"'"+' WHERE "SlideSettingID"='+"#{@slidesettinfo.SlideSettingID}"+';'
        ActiveRecord::Base.connection.execute(quer);
        ActiveRecord::Base.connection.execute(quer_second);
        format.html { redirect_to @tbl_slide_setting}
        format.json { render :show, status: :created, location: @tbl_slide_setting }
      else
        format.html { render :new }
        format.json { render json: @tbl_slide_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tbl_slide_settings/1
  # PATCH/PUT /tbl_slide_settings/1.json
  def update
    respond_to do |format|
      if @tbl_slide_setting.update(tbl_slide_setting_params)
        format.html { redirect_to @tbl_slide_setting, notice: 'Tbl slide setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @tbl_slide_setting }
      else
        format.html { render :edit }
        format.json { render json: @tbl_slide_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tbl_slide_settings/1
  # DELETE /tbl_slide_settings/1.json
  def destroy
    @tbl_slide_setting.destroy
    respond_to do |format|
      format.html { redirect_to tbl_slide_settings_url, notice: 'Tbl slide setting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tbl_slide_setting
      @tbl_slide_setting = TblSlideSetting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tbl_slide_setting_params
      params.require(:tbl_slide_setting).permit(:SlideSettingID,:Setting,:offsetxin, :offsetxout, :offsetyin, :offsetyout, :rotatein, :rotateout, :fadein, :fadeout,:showuntil,:rotatexin,:rotatexout,:rotateyin,:rotateyout,:scalexin,:scalexout,:scaleyin,:scaleyout,:skewxin,:skewxout,:skewyin,:skewyout,:transformoriginin,:transformoriginout, :easingin, :easingout, :durationin,:durationout, :delayin, :transition2d, :transition3d)
    end
end

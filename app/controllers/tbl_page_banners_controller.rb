class TblPageBannersController < ApplicationController
  before_action :set_tbl_page_banner, only: [:show, :edit, :update, :destroy]

  # GET /tbl_page_banners
  # GET /tbl_page_banners.json
  def index
    @tbl_page_banners = TblPageBanner.all
  end

  # GET /tbl_page_banners/1
  # GET /tbl_page_banners/1.json
  def show
  end

  # GET /tbl_page_banners/new
  def new
    @tbl_page_banner = TblPageBanner.new
  end

  # GET /tbl_page_banners/1/edit
  def edit
  end

  # POST /tbl_page_banners
  # POST /tbl_page_banners.json
  def create
    @tbl_page_banner = TblPageBanner.new(tbl_page_banner_params)

    respond_to do |format|
      if @tbl_page_banner.save
        format.html { redirect_to @tbl_page_banner, notice: 'Tbl page banner was successfully created.' }
        format.json { render :show, status: :created, location: @tbl_page_banner }
      else
        format.html { render :new }
        format.json { render json: @tbl_page_banner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tbl_page_banners/1
  # PATCH/PUT /tbl_page_banners/1.json
  def update
    respond_to do |format|
      if @tbl_page_banner.update(tbl_page_banner_params)
        format.html { redirect_to @tbl_page_banner, notice: 'Tbl page banner was successfully updated.' }
        format.json { render :show, status: :ok, location: @tbl_page_banner }
      else
        format.html { render :edit }
        format.json { render json: @tbl_page_banner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tbl_page_banners/1
  # DELETE /tbl_page_banners/1.json
  def destroy
    @tbl_page_banner.destroy
    respond_to do |format|
      format.html { redirect_to tbl_page_banners_url, notice: 'Tbl page banner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tbl_page_banner
      @tbl_page_banner = TblPageBanner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tbl_page_banner_params
      params.require(:tbl_page_banner).permit(:PageID, :BannerID)
    end
end

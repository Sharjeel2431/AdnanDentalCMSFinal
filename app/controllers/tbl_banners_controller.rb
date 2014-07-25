class TblBannersController < ApplicationController
  before_action :set_tbl_banner, only: [:show, :edit, :update, :destroy]

  # GET /tbl_banners
  # GET /tbl_banners.json
  def index
    @tbl_banners = TblBanner.all
   session[:bannerdeletionedit]=0
    session[:oneditpage]=0

   # session[:deletebannerissue]=0
  end

  # GET /tbl_banners/1
  # GET /tbl_banners/1.json
  def show


  end

  # GET /tbl_banners/new
  def new
    @tbl_banner = TblBanner.new

    if params[:id] == nil
    session[:decision]=0
    else

      session[:pageid]=params[:id]
      session[:decision]=1
    end



  end

  # GET /tbl_banners/1/edit
  def edit

      if session[:fromeditpage] == 1

        @SlideInfo=TblSlide.find_by_BannerID(params[:id])

        if @SlideInfo == nil


          session[:contentlayerslider]=1
        else

          session[:contentlayerslider]=0
        end


      end

  end

  # POST /tbl_banners
  # POST /tbl_banners.json
  def create
    @tbl_banner = TblBanner.new(tbl_banner_params)

    respond_to do |format|
      if @tbl_banner.save
        format.html { redirect_to @tbl_banner, notice: 'Tbl banner was successfully created.' }

        @querylast=  TblBanner.last()

        @BannerID=@querylast.BannerID


        if params[:id] = @BannerID
          if session[:decision] == 1

            query = "INSERT INTO tbl_page_banners (PageID,BannerID) VALUES (#{session[:pageid]}, #{@BannerID});"

            ActiveRecord::Base.connection.execute(query);

          end

        end


        format.json { render :show, status: :created, location: @tbl_banner }
      else
        format.html { render :new }
        format.json { render json: @tbl_banner.errors, status: :unprocessable_entity }
      end
    end
  end
  def settings
    if session[:fromeditpage] == 1

    end
  end
  # PATCH/PUT /tbl_banners/1
  # PATCH/PUT /tbl_banners/1.json
  def update
    respond_to do |format|
      if @tbl_banner.update(tbl_banner_params)

        if session[:oneditpage] == 1

      ###################### Select Pic SettingID from the Drop Down List and Save into the Banner Table ########################

          if params[:picsetting_hid] == ""
            @queryfirst=TblPicSetting.first()
            @picsettingID=@queryfirst.PicSettingID
            params[:picsetting_hid]=@picsettingID
          end

          query='UPDATE tbl_banners SET "PicSettingID"='+"#{params[:picsetting_hid]}"+' Where "BannerID"='+"#{params[:id]};"
          ActiveRecord::Base.connection.execute(query);

      ###########################################################################################################################

      ##################### Select PlaceHolder from the Drop Down List and Save into the Banner Table ###########################
            if params[:banner_hid] == ""
              @querybannerfirst=TblBanner.first()
              @placeholder=@querybannerfirst.PlaceHolder
              params[:banner_hid]=@placeholder
            end

          quer='UPDATE tbl_banners SET "PlaceHolder"='+"'"+"#{params[:banner_hid]}"+"'"+' Where "BannerID"='+"#{params[:id]};"
          ActiveRecord::Base.connection.execute(quer);

      ###########################################################################################################################

      ##################### Select Type from the Drop Down List and Save into the Banner Table ###########################
          if params[:type_hid] == ""
            @querybannerfirst=TblBanner.first()
            @placeholder=@querybannerfirst.Type
            params[:type_hid]=@placeholder
          end

          quers='UPDATE tbl_banners SET "Type"='+"'"+"#{params[:type_hid]}"+"'"+' Where "BannerID"='+"#{params[:id]};"
          ActiveRecord::Base.connection.execute(quers);

      ###########################################################################################################################



          format.html { redirect_to '/'+session[:pageidonedit]+'/edit/'+session[:pageidonedit], notice: 'Tbl banner was successfully updated.' }
        else
          format.html { redirect_to @tbl_banner, notice: 'Tbl banner was successfully updated.' }
        end

        format.json { render :show, status: :ok, location: @tbl_banner }
      else
        format.html { render :edit }
        format.json { render json: @tbl_banner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tbl_banners/1
  # DELETE /tbl_banners/1.json
  def destroy

   if params[:id] != nil
        if  session[:bannerdeletionedit] == 1
       query = 'DELETE FROM tbl_page_banners where "PageID" ='+"#{session[:pageid]}"+' and "BannerID" ='+"#{params[:id]};"

        ActiveRecord::Base.connection.execute(query);
       end
   end

   if session[:bannerdeletionedit] == 0
     query = 'DELETE FROM tbl_page_banners where "PageID" ='+"#{session[:pageid]}"+' and "BannerID" ='+"#{params[:id]};"

     ActiveRecord::Base.connection.execute(query);

     @tbl_banner.destroy
   end


    respond_to do |format|
      format.html { redirect_to tbl_banners_url, notice: 'Tbl banner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tbl_banner
      @tbl_banner = TblBanner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tbl_banner_params
      params.require(:tbl_banner).permit(:BannerID, :Title,:PlaceHolder, :Description, :ToolTip, :RedirectLink, :Type, :Status,:PicSettingID)
    end
end

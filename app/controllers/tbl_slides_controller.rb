class TblSlidesController < ApplicationController
  before_action :set_tbl_slide, only: [:show, :edit, :update, :destroy]

  # GET /tbl_slides
  # GET /tbl_slides.json
  def index
    @tbl_slides = TblSlide.all
    session[:fromeditpage]=0
    session[:fromslides]=1



  end

  # GET /tbl_slides/1
  # GET /tbl_slides/1.json
  def show
  end

  # GET /tbl_slides/new
  def new
    @tbl_slide = TblSlide.new
    if params[:id] != nil
      session[:fromeditpage]=1
      session[:bannerID]=params[:id]
    else
      session[:fromeditpage]=0
    end

  end

  # GET /tbl_slides/1/edit
  def edit
    @slideinfo=TblSlide.find_by_SlideID(params[:id])
    @Transname=@slideinfo.SlideTransition
    session[:oneditslide]=1

  end

  def settings
    if session[:fromeditpage] == 1

    end
  end
  # POST /tbl_slides
  # POST /tbl_slides.json
  def create
    @tbl_slide = TblSlide.new(tbl_slide_params)
    ################### Require For Paper Clip ##########################
    @tbl_slide = TblSlide.create(tbl_slide_params)
    #####################################################################
    respond_to do |format|
      if @tbl_slide.save

        format.html { redirect_to @tbl_slide, notice: 'Tbl slide was successfully created.' }

        if session[:fromeditpage] == 1

          ########### Update the Banner ID while adding Slide to the Specific Banner ##############

          @querylast=TblSlide.last()
          @last=@querylast.SlideID

          query='UPDATE tbl_slides SET "BannerID"='+"#{session[:bannerID]}" +'Where "SlideID"='+"#{@last}"+';'
          ActiveRecord::Base.connection.execute(query);

          #########################################################################################

          ########### Update the Slide Transition From Dropdown while adding Slide to the Specific Banner ##############

          @querylastID=TblSlide.last()
          @lastID=@querylastID.SlideID

          if params[:slidetrans_hid] ==  ""

            @queryfirst=Transition.first()

            params[:slidetrans_hid]=@queryfirst.TransitionID

          end

          @info=Transition.find_by_TransitionID(params[:slidetrans_hid])
          @SlideTrans=@info.TransitionName


          quer='UPDATE tbl_slides SET "SlideTransition"='+"'"+"#{@SlideTrans}"+"'"+' Where "SlideID"='+"#{@lastID}"+';'
          ActiveRecord::Base.connection.execute(quer);

          #############################################################################################################

          ################################# Transition Select from the DropDown #######################################
            if params[:transition_hid] == ""
                  params[:transition_hid]="2d"
            end
             qy='UPDATE tbl_slides SET "Transition"='+"'"+params[:transition_hid]+"'"+'Where "SlideID"='+"#{@lastID}"+';'
             ActiveRecord::Base.connection.execute(qy);
          #############################################################################################################



          ################################## Add Div of Layer Slider #################################################


          @infobanner=TblBanner.find_by_BannerID(session[:bannerID])
          @placeholder=@infobanner.PlaceHolder

          #################################### Settings Info #####################################################
          if params[:slidesetting_hid]==""
            @slidesettinginfo=TblSlideSetting.first()
            params[:slidesetting_hid]=@slidesettinginfo.SlideSettingID

          end
          quer_sett='UPDATE tbl_slides SET "Setting"='+"'"+"#{params[:slidesetting_hid]}"+"'"+' Where "SlideID"='+"#{@lastID};"
          ActiveRecord::Base.connection.execute(quer_sett);


          ####info of slide setting table on the basis of the setting selected in the dropdown list####
          @slidesetinfo=TblSlideSetting.find_by_SlideSettingID(params[:slidesetting_hid])

          ########################################################################################################

          contentlayerslider='<div id="layerslider" style="width: 800px; height: 400px;"><div class="'+@querylastID.SlideClass+'" data-ls="slidedelay: "'+@querylastID.SlideDelay.to_s+'; transition2d: 75,79;"><img src="'+ @tbl_slide.avatar.url(:small)+'" class="ls-bg" /></div>'
          contentlayerslid='<div id="layerslider" style="width: 800px; height: 400px;"><div class="'+@querylastID.SlideClass+'" data-ls="slidedelay: "'+@querylastID.SlideDelay.to_s+';  transition2d: 75,79;"><img src="'+@tbl_slide.avatar.url(:small)+'" class="ls-bg" />'
          slides='<div class="'+@querylastID.SlideClass+'" data-ls="slidedelay:'+@querylastID.SlideDelay.to_s+';  transition2d: 75,79;"><img src="'+ @tbl_slide.avatar.url(:small)+'" class="ls-bg" data-ls="
					offsetxin: '+@slidesetinfo.offsetxin+';
					offsetxout:'+@slidesetinfo.offsetxout+';
					offsetyin: '+@slidesetinfo.offsetyin+';
					offsetyout: '+@slidesetinfo.offsetyout+';
					rotatein: '+@slidesetinfo.rotatein+';
					rotateout: '+@slidesetinfo.rotateout+';
					fadein: '+@slidesetinfo.fadein.to_s+';
					fadeout: '+@slidesetinfo.fadeout.to_s+';
					easingin: '+@slidesetinfo.easingin+';
					easingout: '+@slidesetinfo.easingout+';
					durationin: '+@slidesetinfo.durationin+';
					delayin: '+@slidesetinfo.delayin+';
          showuntil:'+@slidesetinfo.showuntil.to_s+';
          rotatexin: '+@slidesetinfo.rotatexin.to_s+';
          rotatexout: '+@slidesetinfo.rotatexout.to_s+';
          rotateyin: '+@slidesetinfo.rotateyin.to_s+';
          rotateyout: '+@slidesetinfo.rotateyout.to_s+';
          scalexin: '+@slidesetinfo.scalexin.to_s+';
          scalexout: '+@slidesetinfo.scalexout.to_s+';
          scaleyin: '+@slidesetinfo.scaleyin.to_s+';
          scaleyout: '+@slidesetinfo.scaleyout.to_s+';
          skewxin: '+@slidesetinfo.skewxin.to_s+';
          skewxout: '+@slidesetinfo.skewxout.to_s+';
          skewyin: '+@slidesetinfo.skewyin.to_s+';
          skewyout: '+@slidesetinfo.skewyout.to_s+';
          transformoriginin: '+@slidesetinfo.transformoriginin+';
          transformoriginout: '+@slidesetinfo.transformoriginout+';
				"/></div>'


      if session[:contentlayerslider] == 1


        quernil='UPDATE tbl_contents SET "ContentValue"='+"'"+"#{contentlayerslider}"+"'"+' WHERE "PlaceHolder"='+"'"+"#{@placeholder}"+"'"+';'
        ActiveRecord::Base.connection.execute(quernil);

      else

        #qunil="UPDATE tbl_contents SET ContentValue='#{contentlayerslid}' WHERE PlaceHolder='#{@placeholder}';"
        #ActiveRecord::Base.connection.execute(qunil);

        @infobann=TblBanner.find_by_BannerID(session[:bannerID])
        @placeh=@infobann.PlaceHolder
        @placeinfo=TblPlaceHolder.find_by_PlaceHolderTitle(@placeh)
        @placeholID=@placeinfo.PlaceHolderID
        @placcontentInfor=TblPlaceHolderContent.find_by_PlaceHolderID(@placeholID)
        @Contentid=@placcontentInfor.ContentID
        @contentinfor=TblContent.find_by_ContentID(@Contentid)


        @SlideInfo=TblSlide.where(BannerID: session[:bannerID])

        @SlideInfo.each do |index|


          contentnew=@contentinfor.ContentValue+slides+'</div>'

          dasd='UPDATE tbl_contents SET "ContentValue"='+"'"+"#{contentnew}"+"'"+'where "PlaceHolder"='+"'"+"#{@placeh}"+"'"+';'



          ActiveRecord::Base.connection.execute(dasd);


        end



        #############################################################################################################



end



        end
        format.json { render :show, status: :created, location: @tbl_slide }
      else
        format.html { render :new }
        format.json { render json: @tbl_slide.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tbl_slides/1
  # PATCH/PUT /tbl_slides/1.json
  def update
    respond_to do |format|
      if @tbl_slide.update(tbl_slide_params)
        format.html { redirect_to @tbl_slide, notice: 'Tbl slide was successfully updated.' }
        if session[:fromeditpage] == 1


        if params[:slidetrans_hid] == ""

          @slideinfo=TblSlide.find_by_SlideID(params[:id])
          @trans=@slideinfo.SlideTransition
          @transinfo=Transition.find_by_TransitionName(@trans)
          @transID=@transinfo.TransitionID
          params[:slidetrans_hid]=@transID

        end
        @transinfo=Transition.find_by_TransitionID(params[:slidetrans_hid])
        @transname=@transinfo.TransitionName

        querup='UPDATE tbl_slides SET "SlideTransition"='+"'"+"#{@transname}"+"'"+' Where "SlideID"='+"#{params[:id]}"+';'
        ActiveRecord::Base.connection.execute(querup);

        end
        format.json { render :show, status: :ok, location: @tbl_slide }
      else
        format.html { render :edit }
        format.json { render json: @tbl_slide.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tbl_slides/1
  # DELETE /tbl_slides/1.json
  def destroy
    @tbl_slide.destroy

    if session[:fromeditpage] == 1
      qu='DELETE FROM tbl_slide_layers WHERE "SlideID"='+"#{params[:id]}"+';'
      ActiveRecord::Base.connection.execute(qu);
    end
    respond_to do |format|
      format.html { redirect_to tbl_slides_url, notice: 'Tbl slide was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tbl_slide
      @tbl_slide = TblSlide.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tbl_slide_params
      params.require(:tbl_slide).permit(:SlideID, :SlideClass, :SlideDelay, :Transition, :BackgroundImage, :SlideTransition, :BannerID,:avatar,:Setting)
    end

end

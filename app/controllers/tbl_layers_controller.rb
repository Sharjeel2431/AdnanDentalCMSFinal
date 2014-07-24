class TblLayersController < ApplicationController
  before_action :set_tbl_layer, only: [:show, :edit, :update, :destroy]

  # GET /tbl_layers
  # GET /tbl_layers.json
  def index
    @tbl_layers = TblLayer.all

  end

  # GET /tbl_layers/1
  # GET /tbl_layers/1.json
  def show
  end

  # GET /tbl_layers/new
  def new
    @tbl_layer = TblLayer.new
    if params[:id] != nil
      session[:slideid]=params[:id]
      session[:fromslides]=1
    else
      session[:fromslides]=0
    end

  end

  # GET /tbl_layers/1/edit
  def edit
  end

  # POST /tbl_layers
  # POST /tbl_layers.json
  def create
    @tbl_layer = TblLayer.new(tbl_layer_params)

    respond_to do |format|
      if @tbl_layer.save

        format.html { redirect_to @tbl_layer, notice: 'Tbl layer was successfully created.' }



        @querylast=TblLayer.last()
        @layerid=@querylast.LayerID
        if session[:fromslides] == 1

        query='INSERT INTO tbl_slide_layers ("SlideID","LayerID") values ('+"#{session[:slideid]}"+",#{@layerid});"
        ActiveRecord::Base.connection.execute(query);

        @type=@querylast.Type
          if @type == "Image"
            content='<!-- Image Layer --> <br/> <img  class="'+@querylast.Class+'"/>'
            quer='UPDATE tbl_layers SET "Content"='+"'"+"#{content}"+"'"+' Where "LayerID"='+"#{@layerid};"
            ActiveRecord::Base.connection.execute(quer);
          end
          if @type == "Text"
            content='<!-- Text Layer --> <br/> <h1 class="'+@querylast.Class+'">Here is the text layer</h1>'
            quer='UPDATE tbl_layers SET "Content"='+"'"+"#{content}"+"'"+' Where "LayerID"='+"#{@layerid};"
            ActiveRecord::Base.connection.execute(quer);
          end

        ######################### added to add layer content to the banner content #####################################
        @infobann=TblBanner.find_by_BannerID(session[:bannerID])
        @placeh=@infobann.PlaceHolder
        @placeinfo=TblPlaceHolder.find_by_PlaceHolderTitle(@placeh)
        @placeholID=@placeinfo.PlaceHolderID
        @placcontentInfor=TblPlaceHolderContent.find_by_PlaceHolderID(@placeholID)
        @Contentid=@placcontentInfor.ContentID
        @contentinfor=TblContent.find_by_ContentID(@Contentid)

        @layerinfo=TblLayer.find_by_LayerID(@layerid)


          @contentnew="'"+@contentinfor.ContentValue+@layerinfo.Content+"'"
          querlayer='UPDATE tbl_contents SET "ContentValue"='+"#{@contentnew}"+'WHERE "ContentID" ='+"#{@Contentid}"+';'
         ActiveRecord::Base.connection.execute(querlayer);
        ################################################################################################################
        end

        format.json { render :show, status: :created, location: @tbl_layer }
      else
        format.html { render :new }
        format.json { render json: @tbl_layer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tbl_layers/1
  # PATCH/PUT /tbl_layers/1.json
  def update
    respond_to do |format|
      if @tbl_layer.update(tbl_layer_params)
        format.html { redirect_to @tbl_layer, notice: 'Tbl layer was successfully updated.' }
        format.json { render :show, status: :ok, location: @tbl_layer }
      else
        format.html { render :edit }
        format.json { render json: @tbl_layer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tbl_layers/1
  # DELETE /tbl_layers/1.json
  def destroy
    @tbl_layer.destroy
    respond_to do |format|
      format.html { redirect_to tbl_layers_url, notice: 'Tbl layer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tbl_layer
      @tbl_layer = TblLayer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tbl_layer_params
      params.require(:tbl_layer).permit(:LayerID, :Class, :Type, :Content)
    end
end

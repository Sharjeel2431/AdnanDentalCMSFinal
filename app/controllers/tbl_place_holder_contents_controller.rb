class TblPlaceHolderContentsController < ApplicationController
  before_action :set_tbl_place_holder_content, only: [:show, :edit, :update, :destroy]

  # GET /tbl_place_holder_contents
  # GET /tbl_place_holder_contents.json
  def index
    @tbl_place_holder_contents = TblPlaceHolderContent.all
  end

  # GET /tbl_place_holder_contents/1
  # GET /tbl_place_holder_contents/1.json
  def show
  end

  # GET /tbl_place_holder_contents/new
  def new
    @tbl_place_holder_content = TblPlaceHolderContent.new
  end

  # GET /tbl_place_holder_contents/1/edit
  def edit
  end

  # POST /tbl_place_holder_contents
  # POST /tbl_place_holder_contents.json
  def create
    @tbl_place_holder_content = TblPlaceHolderContent.new(tbl_place_holder_content_params)

    respond_to do |format|
      if @tbl_place_holder_content.save
        format.html { redirect_to @tbl_place_holder_content, notice: 'Tbl place holder content was successfully created.' }
        format.json { render :show, status: :created, location: @tbl_place_holder_content }
      else
        format.html { render :new }
        format.json { render json: @tbl_place_holder_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tbl_place_holder_contents/1
  # PATCH/PUT /tbl_place_holder_contents/1.json
  def update
    respond_to do |format|
      if @tbl_place_holder_content.update(tbl_place_holder_content_params)
        format.html { redirect_to @tbl_place_holder_content, notice: 'Tbl place holder content was successfully updated.' }
        format.json { render :show, status: :ok, location: @tbl_place_holder_content }
      else
        format.html { render :edit }
        format.json { render json: @tbl_place_holder_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tbl_place_holder_contents/1
  # DELETE /tbl_place_holder_contents/1.json
  def destroy
    @tbl_place_holder_content.destroy
    respond_to do |format|
      format.html { redirect_to tbl_place_holder_contents_url, notice: 'Tbl place holder content was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tbl_place_holder_content
      @tbl_place_holder_content = TblPlaceHolderContent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tbl_place_holder_content_params
      params.require(:tbl_place_holder_content).permit(:PlaceHolderID, :ContentID)
    end
end

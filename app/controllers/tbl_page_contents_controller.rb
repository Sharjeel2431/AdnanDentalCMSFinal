class TblPageContentsController < ApplicationController
  before_action :set_tbl_page_content, only: [:show, :edit, :update, :destroy]

  # GET /tbl_page_contents
  # GET /tbl_page_contents.json
  def index
    @tbl_page_contents = TblPageContent.all
  end

  # GET /tbl_page_contents/1
  # GET /tbl_page_contents/1.json
  def show
  end

  # GET /tbl_page_contents/new
  def new
    @tbl_page_content = TblPageContent.new
  end

  # GET /tbl_page_contents/1/edit
  def edit
  end

  # POST /tbl_page_contents
  # POST /tbl_page_contents.json
  def create
    @tbl_page_content = TblPageContent.new(tbl_page_content_params)

    respond_to do |format|
      if @tbl_page_content.save
        format.html { redirect_to @tbl_page_content, notice: 'Tbl page content was successfully created.' }
        format.json { render :show, status: :created, location: @tbl_page_content }
      else
        format.html { render :new }
        format.json { render json: @tbl_page_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tbl_page_contents/1
  # PATCH/PUT /tbl_page_contents/1.json
  def update
    respond_to do |format|
      if @tbl_page_content.update(tbl_page_content_params)
        format.html { redirect_to @tbl_page_content, notice: 'Tbl page content was successfully updated.' }
        format.json { render :show, status: :ok, location: @tbl_page_content }
      else
        format.html { render :edit }
        format.json { render json: @tbl_page_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tbl_page_contents/1
  # DELETE /tbl_page_contents/1.json
  def destroy
    @tbl_page_content.destroy
    respond_to do |format|
      format.html { redirect_to tbl_page_contents_url, notice: 'Tbl page content was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tbl_page_content
      @tbl_page_content = TblPageContent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tbl_page_content_params
      params.require(:tbl_page_content).permit(:PageID, :ContentID)
    end
end

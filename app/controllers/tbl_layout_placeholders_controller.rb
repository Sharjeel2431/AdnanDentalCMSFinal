class TblLayoutPlaceholdersController < ApplicationController
  before_action :set_tbl_layout_placeholder, only: [:show, :edit, :update, :destroy]

  # GET /tbl_layout_placeholders
  # GET /tbl_layout_placeholders.json
  def index
    @tbl_layout_placeholders = TblLayoutPlaceholder.all
  end

  # GET /tbl_layout_placeholders/1
  # GET /tbl_layout_placeholders/1.json
  def show
  end

  # GET /tbl_layout_placeholders/new
  def new
    @tbl_layout_placeholder = TblLayoutPlaceholder.new
  end

  # GET /tbl_layout_placeholders/1/edit
  def edit
  end

  # POST /tbl_layout_placeholders
  # POST /tbl_layout_placeholders.json
  def create
    @tbl_layout_placeholder = TblLayoutPlaceholder.new(tbl_layout_placeholder_params)

    respond_to do |format|
      if @tbl_layout_placeholder.save
        format.html { redirect_to @tbl_layout_placeholder, notice: 'Tbl layout placeholder was successfully created.' }
        format.json { render :show, status: :created, location: @tbl_layout_placeholder }
      else
        format.html { render :new }
        format.json { render json: @tbl_layout_placeholder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tbl_layout_placeholders/1
  # PATCH/PUT /tbl_layout_placeholders/1.json
  def update
    respond_to do |format|
      if @tbl_layout_placeholder.update(tbl_layout_placeholder_params)
        format.html { redirect_to @tbl_layout_placeholder, notice: 'Tbl layout placeholder was successfully updated.' }
        format.json { render :show, status: :ok, location: @tbl_layout_placeholder }
      else
        format.html { render :edit }
        format.json { render json: @tbl_layout_placeholder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tbl_layout_placeholders/1
  # DELETE /tbl_layout_placeholders/1.json
  def destroy
    @tbl_layout_placeholder.destroy
    respond_to do |format|
      format.html { redirect_to tbl_layout_placeholders_url, notice: 'Tbl layout placeholder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tbl_layout_placeholder
      @tbl_layout_placeholder = TblLayoutPlaceholder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tbl_layout_placeholder_params
      params.require(:tbl_layout_placeholder).permit(:LayoutID, :PlaceHolderID)
    end
end

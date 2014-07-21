class TblPageCategoriesController < ApplicationController
  before_action :set_tbl_page_category, only: [:show, :edit, :update, :destroy]

  # GET /tbl_page_categories
  # GET /tbl_page_categories.json
  def index
    @tbl_page_categories = TblPageCategory.all

  end

  # GET /tbl_page_categories/1
  # GET /tbl_page_categories/1.json
  def show
  end

  # GET /tbl_page_categories/new
  def new
    @tbl_page_category = TblPageCategory.new
  end

  # GET /tbl_page_categories/1/edit
  def edit
  end

  # POST /tbl_page_categories
  # POST /tbl_page_categories.json
  def create
    @tbl_page_category = TblPageCategory.new(tbl_page_category_params)

    respond_to do |format|
      if @tbl_page_category.save
        format.html { redirect_to @tbl_page_category, notice: 'Tbl page category was successfully created.' }
        format.json { render :show, status: :created, location: @tbl_page_category }
      else
        format.html { render :new }
        format.json { render json: @tbl_page_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tbl_page_categories/1
  # PATCH/PUT /tbl_page_categories/1.json
  def update
    respond_to do |format|
      if @tbl_page_category.update(tbl_page_category_params)
        format.html { redirect_to @tbl_page_category, notice: 'Tbl page category was successfully updated.' }
        format.json { render :show, status: :ok, location: @tbl_page_category }
      else
        format.html { render :edit }
        format.json { render json: @tbl_page_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tbl_page_categories/1
  # DELETE /tbl_page_categories/1.json
  def destroy
    @tbl_page_category.destroy
    respond_to do |format|
      format.html { redirect_to tbl_page_categories_url, notice: 'Tbl page category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tbl_page_category
      @tbl_page_category = TblPageCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tbl_page_category_params
      params.require(:tbl_page_category).permit(:CategoryID, :PageID)
    end
end

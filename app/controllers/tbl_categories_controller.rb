class TblCategoriesController < ApplicationController
  before_action :set_tbl_category, only: [:show, :edit, :update, :destroy]

  # GET /tbl_categories
  # GET /tbl_categories.json
  def index
    @tbl_categories = TblCategory.all

  end

  # GET /tbl_categories/1
  # GET /tbl_categories/1.json
  def show
  end

  # GET /tbl_categories/new
  def new
    @tbl_category = TblCategory.new
  end

  # GET /tbl_categories/1/edit
  def edit
  end

  # POST /tbl_categories
  # POST /tbl_categories.json
  def create
    @tbl_category = TblCategory.new(tbl_category_params)

    respond_to do |format|
      if @tbl_category.save
        format.html { redirect_to @tbl_category, notice: 'Tbl category was successfully created.' }
        format.json { render :show, status: :created, location: @tbl_category }
      else
        format.html { render :new }
        format.json { render json: @tbl_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tbl_categories/1
  # PATCH/PUT /tbl_categories/1.json
  def update
    respond_to do |format|
      if @tbl_category.update(tbl_category_params)
        format.html { redirect_to @tbl_category, notice: 'Tbl category was successfully updated.' }
        format.json { render :show, status: :ok, location: @tbl_category }
      else
        format.html { render :edit }
        format.json { render json: @tbl_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tbl_categories/1
  # DELETE /tbl_categories/1.json
  def destroy
    @tbl_category.destroy

    #if deleted from category table then delete entry from page categories as well
    query="DELETE FROM tbl_page_categories WHERE CategoryID=#{@tbl_category.CategoryID};"
    ActiveRecord::Base.connection.execute(query);

    respond_to do |format|
      format.html { redirect_to tbl_categories_url, notice: 'Tbl category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tbl_category
      @tbl_category = TblCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tbl_category_params
      params.require(:tbl_category).permit(:CategoryID, :CategoryTitle, :CategoryURL, :Type, :IsPrimaryNav, :IsSecondaryNav, :Status)
    end
end

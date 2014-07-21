class TblPageFormsController < ApplicationController
  before_action :set_tbl_page_form, only: [:show, :edit, :update, :destroy]

  # GET /tbl_page_forms
  # GET /tbl_page_forms.json
  def index
    @tbl_page_forms = TblPageForm.all
  end

  # GET /tbl_page_forms/1
  # GET /tbl_page_forms/1.json
  def show
  end

  # GET /tbl_page_forms/new
  def new
    @tbl_page_form = TblPageForm.new
  end

  # GET /tbl_page_forms/1/edit
  def edit
  end

  # POST /tbl_page_forms
  # POST /tbl_page_forms.json
  def create
    @tbl_page_form = TblPageForm.new(tbl_page_form_params)

    respond_to do |format|
      if @tbl_page_form.save
        format.html { redirect_to @tbl_page_form, notice: 'Tbl page form was successfully created.' }
        format.json { render :show, status: :created, location: @tbl_page_form }
      else
        format.html { render :new }
        format.json { render json: @tbl_page_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tbl_page_forms/1
  # PATCH/PUT /tbl_page_forms/1.json
  def update
    respond_to do |format|
      if @tbl_page_form.update(tbl_page_form_params)
        format.html { redirect_to @tbl_page_form, notice: 'Tbl page form was successfully updated.' }
        format.json { render :show, status: :ok, location: @tbl_page_form }
      else
        format.html { render :edit }
        format.json { render json: @tbl_page_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tbl_page_forms/1
  # DELETE /tbl_page_forms/1.json
  def destroy
    @tbl_page_form.destroy
    respond_to do |format|
      format.html { redirect_to tbl_page_forms_url, notice: 'Tbl page form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tbl_page_form
      @tbl_page_form = TblPageForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tbl_page_form_params
      params.require(:tbl_page_form).permit(:PageID, :FormID)
    end
end

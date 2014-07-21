class TblFormFieldHelpersController < ApplicationController
  before_action :set_tbl_form_field_helper, only: [:show, :edit, :update, :destroy]

  # GET /tbl_form_field_helpers
  # GET /tbl_form_field_helpers.json
  def index
    @tbl_form_field_helpers = TblFormFieldHelper.all
  end

  # GET /tbl_form_field_helpers/1
  # GET /tbl_form_field_helpers/1.json
  def show
  end

  # GET /tbl_form_field_helpers/new
  def new
    @tbl_form_field_helper = TblFormFieldHelper.new
  end

  # GET /tbl_form_field_helpers/1/edit
  def edit
  end

  # POST /tbl_form_field_helpers
  # POST /tbl_form_field_helpers.json
  def create
    @tbl_form_field_helper = TblFormFieldHelper.new(tbl_form_field_helper_params)

    respond_to do |format|
      if @tbl_form_field_helper.save
        format.html { redirect_to @tbl_form_field_helper, notice: 'Tbl form field helper was successfully created.' }
        format.json { render :show, status: :created, location: @tbl_form_field_helper }
      else
        format.html { render :new }
        format.json { render json: @tbl_form_field_helper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tbl_form_field_helpers/1
  # PATCH/PUT /tbl_form_field_helpers/1.json
  def update
    respond_to do |format|
      if @tbl_form_field_helper.update(tbl_form_field_helper_params)
        format.html { redirect_to @tbl_form_field_helper, notice: 'Tbl form field helper was successfully updated.' }
        format.json { render :show, status: :ok, location: @tbl_form_field_helper }
      else
        format.html { render :edit }
        format.json { render json: @tbl_form_field_helper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tbl_form_field_helpers/1
  # DELETE /tbl_form_field_helpers/1.json
  def destroy
    @tbl_form_field_helper.destroy
    respond_to do |format|
      format.html { redirect_to tbl_form_field_helpers_url, notice: 'Tbl form field helper was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tbl_form_field_helper
      @tbl_form_field_helper = TblFormFieldHelper.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tbl_form_field_helper_params
      params.require(:tbl_form_field_helper).permit(:FormID, :FieldID)
    end
end

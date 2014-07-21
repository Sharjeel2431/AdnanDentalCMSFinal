class TblFormFieldsController < ApplicationController
  before_action :set_tbl_form_field, only: [:show, :edit, :update, :destroy]

  # GET /tbl_form_fields
  # GET /tbl_form_fields.json
  def index
    @tbl_form_fields = TblFormField.all
  end

  # GET /tbl_form_fields/1
  # GET /tbl_form_fields/1.json
  def show
  end

  # GET /tbl_form_fields/new
  def new
    @tbl_form_field = TblFormField.new
  end

  # GET /tbl_form_fields/1/edit
  def edit
  end

  # POST /tbl_form_fields
  # POST /tbl_form_fields.json
  def create
    @tbl_form_field = TblFormField.new(tbl_form_field_params)

    respond_to do |format|
      if @tbl_form_field.save
        format.html { redirect_to @tbl_form_field, notice: 'Tbl form field was successfully created.' }
        format.json { render :show, status: :created, location: @tbl_form_field }
      else
        format.html { render :new }
        format.json { render json: @tbl_form_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tbl_form_fields/1
  # PATCH/PUT /tbl_form_fields/1.json
  def update
    respond_to do |format|
      if @tbl_form_field.update(tbl_form_field_params)
        format.html { redirect_to @tbl_form_field, notice: 'Tbl form field was successfully updated.' }
        format.json { render :show, status: :ok, location: @tbl_form_field }
      else
        format.html { render :edit }
        format.json { render json: @tbl_form_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tbl_form_fields/1
  # DELETE /tbl_form_fields/1.json
  def destroy
    @tbl_form_field.destroy
    respond_to do |format|
      format.html { redirect_to tbl_form_fields_url, notice: 'Tbl form field was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tbl_form_field
      @tbl_form_field = TblFormField.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tbl_form_field_params
      params.require(:tbl_form_field).permit(:FieldID, :FieldTitle, :FieldType, :FieldValue, :Tooltip, :Status)
    end
end

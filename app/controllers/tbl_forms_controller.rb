class TblFormsController < ApplicationController
  before_action :set_tbl_form, only: [:show, :edit, :update, :destroy]

  # GET /tbl_forms
  # GET /tbl_forms.json
  def index
    @tbl_forms = TblForm.all
  end

  # GET /tbl_forms/1
  # GET /tbl_forms/1.json
  def show
  end

  # GET /tbl_forms/new
  def new
    @tbl_form = TblForm.new
  end

  # GET /tbl_forms/1/edit
  def edit
  end

  # POST /tbl_forms
  # POST /tbl_forms.json
  def create
    @tbl_form = TblForm.new(tbl_form_params)

    respond_to do |format|
      if @tbl_form.save
        format.html { redirect_to @tbl_form, notice: 'Tbl form was successfully created.' }
        format.json { render :show, status: :created, location: @tbl_form }
      else
        format.html { render :new }
        format.json { render json: @tbl_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tbl_forms/1
  # PATCH/PUT /tbl_forms/1.json
  def update
    respond_to do |format|
      if @tbl_form.update(tbl_form_params)
        format.html { redirect_to @tbl_form, notice: 'Tbl form was successfully updated.' }
        format.json { render :show, status: :ok, location: @tbl_form }
      else
        format.html { render :edit }
        format.json { render json: @tbl_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tbl_forms/1
  # DELETE /tbl_forms/1.json
  def destroy
    @tbl_form.destroy
    respond_to do |format|
      format.html { redirect_to tbl_forms_url, notice: 'Tbl form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tbl_form
      @tbl_form = TblForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tbl_form_params
      params.require(:tbl_form).permit(:FormID, :FormTitle, :FormDescription, :Type, :Status)
    end
end

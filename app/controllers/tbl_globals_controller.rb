class TblGlobalsController < ApplicationController
  before_action :set_tbl_global, only: [:show, :edit, :update, :destroy]

  # GET /tbl_globals
  # GET /tbl_globals.json
  def index
    @tbl_globals = TblGlobal.all
  end

  # GET /tbl_globals/1
  # GET /tbl_globals/1.json
  def show
  end

  # GET /tbl_globals/new
  def new
    @tbl_global = TblGlobal.new
  end

  # GET /tbl_globals/1/edit
  def edit
  end

  # POST /tbl_globals
  # POST /tbl_globals.json
  def create
    @tbl_global = TblGlobal.new(tbl_global_params)

    respond_to do |format|
      if @tbl_global.save
        format.html { redirect_to @tbl_global, notice: 'Tbl global was successfully created.' }
        format.json { render :show, status: :created, location: @tbl_global }
      else
        format.html { render :new }
        format.json { render json: @tbl_global.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tbl_globals/1
  # PATCH/PUT /tbl_globals/1.json
  def update
    respond_to do |format|
      if @tbl_global.update(tbl_global_params)
        format.html { redirect_to @tbl_global, notice: 'Tbl global was successfully updated.' }
        format.json { render :show, status: :ok, location: @tbl_global }
      else
        format.html { render :edit }
        format.json { render json: @tbl_global.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tbl_globals/1
  # DELETE /tbl_globals/1.json
  def destroy
    @tbl_global.destroy
    respond_to do |format|
      format.html { redirect_to tbl_globals_url, notice: 'Tbl global was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tbl_global
      @tbl_global = TblGlobal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tbl_global_params
      params.require(:tbl_global).permit(:Token, :Name, :Status)
    end
end

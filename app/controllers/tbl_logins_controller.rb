class TblLoginsController < ApplicationController
  before_action :set_tbl_login, only: [:show, :edit, :update, :destroy]

  # GET /tbl_logins
  # GET /tbl_logins.json
  def index
    @tbl_logins = TblLogin.all
  end

  # GET /tbl_logins/1
  # GET /tbl_logins/1.json
  def show
  end

  # GET /tbl_logins/new
  def new
    @tbl_login = TblLogin.new
  end

  # GET /tbl_logins/1/edit
  def edit
  end

  # POST /tbl_logins
  # POST /tbl_logins.json
  def create
    @tbl_login = TblLogin.new(tbl_login_params)

    respond_to do |format|
      if @tbl_login.save
        format.html { redirect_to @tbl_login, notice: 'Tbl login was successfully created.' }
        format.json { render :show, status: :created, location: @tbl_login }
      else
        format.html { render :new }
        format.json { render json: @tbl_login.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tbl_logins/1
  # PATCH/PUT /tbl_logins/1.json
  def update
    respond_to do |format|
      if @tbl_login.update(tbl_login_params)
        format.html { redirect_to @tbl_login, notice: 'Tbl login was successfully updated.' }
        format.json { render :show, status: :ok, location: @tbl_login }
      else
        format.html { render :edit }
        format.json { render json: @tbl_login.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tbl_logins/1
  # DELETE /tbl_logins/1.json
  def destroy
    @tbl_login.destroy
    respond_to do |format|
      format.html { redirect_to tbl_logins_url, notice: 'Tbl login was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tbl_login
      @tbl_login = TblLogin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tbl_login_params
      params.require(:tbl_login).permit(:UserName, :Password)
    end
end

class TblLayoutsController < ApplicationController
  before_action :set_tbl_layout, only: [:show, :edit, :update, :destroy]

  # GET /tbl_layouts
  # GET /tbl_layouts.json
  def index
    @tbl_layouts = TblLayout.all

  end

  # GET /tbl_layouts/1
  # GET /tbl_layouts/1.json
  def show
  end

  # GET /tbl_layouts/new
  def new
    @tbl_layout = TblLayout.new
    @type=TblLayout.find_by_sql("select DISTINCT Type from tbl_layouts;")
  end

  # GET /tbl_layouts/1/edit
  def edit
    @tbl_place_holders=TblPlaceHolder.all
    session[:placeholderdeleted]=1

     @info=  TblLayout.find_by_LayoutID(params[:id])
    @type_layout=@info.Type
  end

  # POST /tbl_layouts
  # POST /tbl_layouts.json
  def create
    @tbl_layout = TblLayout.new(tbl_layout_params)

    respond_to do |format|
      if @tbl_layout.save

        if params[:layout_hid]== ""
          params[:layout_hid]="Category"
        end

        format.html { redirect_to @tbl_layout, notice: 'Tbl layout was successfully created.' }
        if params[:id] == nil
          @querylast=  TblLayout.last()

          @layout_last=@querylast.LayoutID

          query="UPDATE tbl_layouts SET Type='#{params[:layout_hid]}' WHERE LayoutID=#{@layout_last};"
          ActiveRecord::Base.connection.execute(query);
        end
        format.json { render :show, status: :created, location: @tbl_layout }
      else
        format.html { render :new }
        format.json { render json: @tbl_layout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tbl_layouts/1
  # PATCH/PUT /tbl_layouts/1.json
  def update
    respond_to do |format|
      if @tbl_layout.update(tbl_layout_params)


        if params[:id]!=nil

          if params[:layout_hid]== ""
            @info_layout=TblLayout.find_by_LayoutID(params[:id])
            params[:layout_hid]= @info_layout.Type

          end

          query="UPDATE tbl_layouts SET Type='#{params[:layout_hid]}' where LayoutID = #{params[:id]};"
          ActiveRecord::Base.connection.execute(query);
        end
          format.html { redirect_to @tbl_layout, notice: 'Tbl layout was successfully updated.' }
        format.json { render :show, status: :ok, location: @tbl_layout }
      else
        format.html { render :edit }
        format.json { render json: @tbl_layout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tbl_layouts/1
  # DELETE /tbl_layouts/1.json
  def destroy
    @tbl_layout.destroy
    respond_to do |format|
      format.html { redirect_to tbl_layouts_url, notice: 'Tbl layout was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tbl_layout
      @tbl_layout = TblLayout.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tbl_layout_params
      params.require(:tbl_layout).permit(:LayoutID, :LayoutTitle, :Value, :Type,:OnStateTag,:FilePath, :Status)
    end
end
